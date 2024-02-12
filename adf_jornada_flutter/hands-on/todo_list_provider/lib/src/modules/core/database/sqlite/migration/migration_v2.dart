import 'package:sqflite/sqflite.dart';

import '../../../utils/migration.dart';
import '../db_info.dart';

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
