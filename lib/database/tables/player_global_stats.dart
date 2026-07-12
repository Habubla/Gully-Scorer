import 'package:drift/drift.dart';

class PlayerGlobalStats extends Table {
  TextColumn get playerId => text()();
  TextColumn get name => text()();
  
  IntColumn get matchesPlayed => integer().withDefault(const Constant(0))();
  IntColumn get totalRuns => integer().withDefault(const Constant(0))();
  IntColumn get totalBallsFaced => integer().withDefault(const Constant(0))();
  IntColumn get totalFours => integer().withDefault(const Constant(0))();
  IntColumn get totalSixes => integer().withDefault(const Constant(0))();
  
  IntColumn get totalOversBowled => integer().withDefault(const Constant(0))();
  IntColumn get totalBallsBowled => integer().withDefault(const Constant(0))();
  IntColumn get totalRunsConceded => integer().withDefault(const Constant(0))();
  IntColumn get totalWicketsTaken => integer().withDefault(const Constant(0))();

  IntColumn get highestScore => integer().withDefault(const Constant(0))();
  IntColumn get bestBowlingWickets => integer().withDefault(const Constant(0))();
  IntColumn get bestBowlingRuns => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {playerId};
}
