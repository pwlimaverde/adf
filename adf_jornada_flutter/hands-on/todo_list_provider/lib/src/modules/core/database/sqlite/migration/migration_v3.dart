import 'package:sqflite/sqflite.dart';

import '../../../utils/migration.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch bath) {
    bath.execute('''
      create table teste2(
        id Integer primary key autoincrement,
      )
    ''');
  }

  @override
  void update(Batch bath) {
    bath.execute('''
      create table teste2(
        id Integer primary key autoincrement,
      )
    ''');
  }
}
