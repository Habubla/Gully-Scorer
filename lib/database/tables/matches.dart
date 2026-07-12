import 'package:drift/drift.dart';

class Matches extends Table {
  TextColumn get id => text()();
  TextColumn get config => text()(); 
  TextColumn get status => text()();
  IntColumn get currentSequenceIndex => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
