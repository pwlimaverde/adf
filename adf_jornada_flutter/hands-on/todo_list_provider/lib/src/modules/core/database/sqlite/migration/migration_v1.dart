import 'package:sqflite/sqflite.dart';

import '../../../utils/migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch bath) {
    bath.execute('''
      create table todo(
        id Integer primary key autoincrement,
        descricao varchar(500) not null,
        data_hora datetime,
        finalizado integer
      )
    ''');
  }

  @override
  void update(Batch bath) {

  }
}
