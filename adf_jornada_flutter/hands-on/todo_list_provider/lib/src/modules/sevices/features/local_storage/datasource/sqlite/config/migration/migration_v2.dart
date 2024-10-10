import 'package:sqflite/sqflite.dart';

import '../interfaces/migration.dart';
import '../utilite/db_info.dart';

class MigrationV2 implements Migration {
  @override
  void call(Batch bath) {
    bath.execute('''
      create table teste(
        id Integer primary key autoincrement,
      )
    ''');
  }
  @override
  DbInfo dbInfo = DbInfo.v2;

}
