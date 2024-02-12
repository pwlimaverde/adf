import 'package:sqflite/sqflite.dart';

import '../../../utils/migration.dart';
import '../db_info.dart';

class MigrationV4 implements Migration {
  @override
  void call(Batch bath) {
    bath.execute('''
      create table teste3(
        id Integer primary key autoincrement,
      )
    ''');
  }
  @override
  DbInfo dbInfo = DbInfo.v4;

}
