import 'package:sqflite/sqflite.dart';

import '../interfaces/migration.dart';
import '../utilite/db_info.dart';

class MigrationV3 implements Migration {
  @override
  void call(Batch bath) {
    bath.execute('''
      create table teste2(
        id Integer primary key autoincrement,
      )
    ''');
  }
  @override
  DbInfo dbInfo = DbInfo.v3;

}
