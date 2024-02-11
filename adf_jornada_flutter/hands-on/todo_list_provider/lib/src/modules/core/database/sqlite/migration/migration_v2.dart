import 'package:sqflite/sqflite.dart';

import '../../../utils/migration.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch bath) {
    bath.execute('''
      create table teste(
        id Integer primary key autoincrement,
      )
    ''');
  }

  @override
  void update(Batch bath) {
    bath.execute('''
      create table teste(
        id Integer primary key autoincrement,
      )
    ''');
  }
}
