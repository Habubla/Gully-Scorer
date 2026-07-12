import 'dart:convert';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import '../database.dart';
import '../../domain/events/match_event.dart';
import '../../domain/models/match_configuration.dart';

class EventRepository {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();
  
  EventRepository(this.db);

  Future<List<MatchEvent>> getEventsForMatch(String matchId) async {
    try {
      final match = await (db.select(db.matches)..where((m) => m.id.equals(matchId))).getSingle();
      final limit = match.currentSequenceIndex;

      final rows = await (db.select(db.matchEvents)
        ..where((e) => e.matchId.equals(matchId))
        ..where((e) => e.sequenceNumber.isSmallerOrEqualValue(limit))
        ..orderBy([(e) => drift.OrderingTerm(expression: e.sequenceNumber, mode: drift.OrderingMode.asc)]))
        .get();
        
      return rows.map((r) => MatchEvent.fromJson(jsonDecode(r.payload))).toList();
    } catch (e) {
      throw Exception('Failed to load events for match $matchId: $e');
    }
  }

  Future<void> createNewMatch(String matchId, MatchConfiguration config, MatchEvent initialEvent) async {
    try {
      await db.transaction(() async {
        await db.into(db.matches).insert(
          MatchesCompanion.insert(
            id: matchId,
            config: jsonEncode(config.toJson()),
            status: "in_progress",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            currentSequenceIndex: const drift.Value(1),
          )
        );

        await db.into(db.matchEvents).insert(MatchEventsCompanion.insert(
          id: _uuid.v4(),
          matchId: matchId,
          sequenceNumber: 1,
          eventType: initialEvent.runtimeType.toString(),
          payload: jsonEncode(initialEvent.toJson()),
          timestamp: DateTime.now(),
        ));
      });
    } catch (e) {
      throw Exception('Failed to create match $matchId: $e');
    }
  }

  Future<void> appendEvent(String matchId, MatchEvent event) async {
    try {
      await db.transaction(() async {
        final match = await (db.select(db.matches)..where((m) => m.id.equals(matchId))).getSingle();
        final newSequence = match.currentSequenceIndex + 1;
        
        await (db.delete(db.matchEvents)
          ..where((e) => e.matchId.equals(matchId))
          ..where((e) => e.sequenceNumber.isBiggerThanValue(match.currentSequenceIndex)))
        .go();

        await db.into(db.matchEvents).insert(MatchEventsCompanion.insert(
          id: _uuid.v4(),
          matchId: matchId,
          sequenceNumber: newSequence,
          eventType: event.runtimeType.toString(),
          payload: jsonEncode(event.toJson()),
          timestamp: DateTime.now(),
        ));

        await (db.update(db.matches)..where((m) => m.id.equals(matchId))).write(
          MatchesCompanion(currentSequenceIndex: drift.Value(newSequence))
        );
      });
    } catch (e) {
      throw Exception('Failed to append event to match $matchId: $e');
    }
  }

  Future<void> undo(String matchId) async {
    try {
      final match = await (db.select(db.matches)..where((m) => m.id.equals(matchId))).getSingle();
      if (match.currentSequenceIndex > 0) {
        await (db.update(db.matches)..where((m) => m.id.equals(matchId))).write(
          MatchesCompanion(currentSequenceIndex: drift.Value(match.currentSequenceIndex - 1))
        );
      }
    } catch (e) {
      throw Exception('Failed to undo in match $matchId: $e');
    }
  }

  Future<void> redo(String matchId) async {
    try {
      final match = await (db.select(db.matches)..where((m) => m.id.equals(matchId))).getSingle();
      
      final maxEvent = await (db.select(db.matchEvents)
        ..where((e) => e.matchId.equals(matchId))
        ..orderBy([(e) => drift.OrderingTerm(expression: e.sequenceNumber, mode: drift.OrderingMode.desc)])
        ..limit(1)
      ).getSingleOrNull();

      if (maxEvent != null && maxEvent.sequenceNumber > match.currentSequenceIndex) {
        await (db.update(db.matches)..where((m) => m.id.equals(matchId))).write(
          MatchesCompanion(currentSequenceIndex: drift.Value(match.currentSequenceIndex + 1))
        );
      }
    } catch (e) {
      throw Exception('Failed to redo in match $matchId: $e');
    }
  }

  Future<void> upsertPlayerStats(List<PlayerGlobalStat> statsToUpdate) async {
    try {
      await db.transaction(() async {
        for (final stat in statsToUpdate) {
          final existing = await (db.select(db.playerGlobalStats)..where((s) => s.playerId.equals(stat.playerId))).getSingleOrNull();
          if (existing == null) {
            await db.into(db.playerGlobalStats).insert(stat);
          } else {
            await (db.update(db.playerGlobalStats)..where((s) => s.playerId.equals(stat.playerId))).write(
              PlayerGlobalStatsCompanion(
                matchesPlayed: drift.Value(existing.matchesPlayed + stat.matchesPlayed),
                totalRuns: drift.Value(existing.totalRuns + stat.totalRuns),
                totalBallsFaced: drift.Value(existing.totalBallsFaced + stat.totalBallsFaced),
                totalFours: drift.Value(existing.totalFours + stat.totalFours),
                totalSixes: drift.Value(existing.totalSixes + stat.totalSixes),
                totalOversBowled: drift.Value(existing.totalOversBowled + stat.totalOversBowled),
                totalBallsBowled: drift.Value(existing.totalBallsBowled + stat.totalBallsBowled),
                totalRunsConceded: drift.Value(existing.totalRunsConceded + stat.totalRunsConceded),
                totalWicketsTaken: drift.Value(existing.totalWicketsTaken + stat.totalWicketsTaken),
              )
            );
          }
        }
      });
    } catch (e) {
      throw Exception('Failed to upsert player stats: $e');
    }
  }

  Future<void> updateFielderNameForDismissal(String matchId, String dismissedPlayerId, String newFielderName) async {
    try {
      final rows = await (db.select(db.matchEvents)..where((e) => e.matchId.equals(matchId))).get();
      for (final row in rows) {
        final event = MatchEvent.fromJson(jsonDecode(row.payload));
        if (event is DeliveryRecordedEvent && event.wicket != null && event.wicket!.dismissedPlayerId == dismissedPlayerId) {
          final updatedWicket = event.wicket!.copyWith(fielderId: newFielderName);
          final updatedEvent = event.copyWith(wicket: updatedWicket);
          await (db.update(db.matchEvents)..where((e) => e.id.equals(row.id))).write(
            MatchEventsCompanion(payload: drift.Value(jsonEncode(updatedEvent.toJson())))
          );
          break; // Assuming one dismissal per player
        }
      }
    } catch (e) {
      throw Exception('Failed to update fielder name for dismissal: $e');
    }
  }
}

