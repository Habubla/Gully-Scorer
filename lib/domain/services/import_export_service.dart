import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../application/match_service.dart';
import '../../database/repositories/event_repository.dart';
import '../../database/database.dart';
import 'package:drift/drift.dart';

class ImportExportService {
  static Future<File> exportDatabase(WidgetRef ref) async {
    final db = ref.read(eventRepositoryProvider).db;
    
    final matches = await db.select(db.matches).get();
    final events = await db.select(db.matchEvents).get();
    final stats = await db.select(db.playerGlobalStats).get();

    final exportData = {
      'matches': matches.map((m) => {
        'id': m.id,
        'config': m.config,
        'status': m.status,
        'createdAt': m.createdAt.toIso8601String(),
        'updatedAt': m.updatedAt.toIso8601String(),
      }).toList(),
      'events': events.map((e) => {
        'id': e.id,
        'matchId': e.matchId,
        'sequenceNumber': e.sequenceNumber,
        'eventType': e.eventType,
        'payload': e.payload,
        'timestamp': e.timestamp.toIso8601String(),
      }).toList(),
      'stats': stats.map((s) => {
        'playerId': s.playerId,
        'name': s.name,
        'matchesPlayed': s.matchesPlayed,
        'totalRuns': s.totalRuns,
        'totalBallsFaced': s.totalBallsFaced,
        'totalFours': s.totalFours,
        'totalSixes': s.totalSixes,
        'totalOversBowled': s.totalOversBowled,
        'totalBallsBowled': s.totalBallsBowled,
        'totalRunsConceded': s.totalRunsConceded,
        'totalWicketsTaken': s.totalWicketsTaken,
      }).toList(),
    };

    final jsonString = jsonEncode(exportData);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/gullyscore_backup_${DateTime.now().millisecondsSinceEpoch}.json');
    await file.writeAsString(jsonString);
    return file;
  }

  static Future<void> importDatabase(File file, WidgetRef ref) async {
    final jsonString = await file.readAsString();
    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    
    final db = ref.read(eventRepositoryProvider).db;

    await db.transaction(() async {
      // Import Matches
      if (data.containsKey('matches')) {
        for (var m in data['matches']) {
          await db.into(db.matches).insertOnConflictUpdate(
            MatchesCompanion.insert(
              id: m['id'],
              config: m['config'],
              status: m['status'],
              createdAt: DateTime.parse(m['createdAt']),
              updatedAt: DateTime.parse(m['updatedAt']),
            )
          );
        }
      }

      // Import Events
      if (data.containsKey('events')) {
        for (var e in data['events']) {
          await db.into(db.matchEvents).insertOnConflictUpdate(
            MatchEventsCompanion.insert(
              id: e['id'],
              matchId: e['matchId'],
              sequenceNumber: e['sequenceNumber'],
              eventType: e['eventType'],
              payload: e['payload'],
              timestamp: DateTime.parse(e['timestamp']),
            )
          );
        }
      }

      // Import Stats
      if (data.containsKey('stats')) {
        for (var s in data['stats']) {
          await db.into(db.playerGlobalStats).insertOnConflictUpdate(
            PlayerGlobalStatsCompanion.insert(
              playerId: s['playerId'],
              name: s['name'],
              matchesPlayed: Value(s['matchesPlayed'] ?? 0),
              totalRuns: Value(s['totalRuns'] ?? 0),
              totalBallsFaced: Value(s['totalBallsFaced'] ?? 0),
              totalFours: Value(s['totalFours'] ?? 0),
              totalSixes: Value(s['totalSixes'] ?? 0),
              totalOversBowled: Value(s['totalOversBowled'] ?? 0),
              totalBallsBowled: Value(s['totalBallsBowled'] ?? 0),
              totalRunsConceded: Value(s['totalRunsConceded'] ?? 0),
              totalWicketsTaken: Value(s['totalWicketsTaken'] ?? 0),
            )
          );
        }
      }
    });
  }
}
