import 'package:drift/drift.dart';

import 'matches.dart';

@DataClassName('MatchEventData')
@TableIndex(name: 'idx_match_events_match_seq', columns: {#matchId, #sequenceNumber})
class MatchEvents extends Table {
  TextColumn get id => text()();
  TextColumn get matchId => text().references(Matches, #id)();
  IntColumn get sequenceNumber => integer()();
  TextColumn get eventType => text()();
  TextColumn get payload => text()(); 
  DateTimeColumn get timestamp => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
