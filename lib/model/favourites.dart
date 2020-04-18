import 'package:moor_flutter/moor_flutter.dart';

class Favourites extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get author => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
}
@UseMoor(
  tables: [Favourites]
)
class MyDatabase extends _$MyDatabase{
   MyDatabase(): super(FlutterQueryExecutor.inDatabaseFolder(path: db.sqlite));
}