import 'package:sqflite/sqflite.dart';

import '../interfaces/migration.dart';
import '../utilite/db_info.dart';





class MigrationV1 implements Migration {
  @override
  void call(Batch bath) {
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
  DbInfo dbInfo = DbInfo.v1;
}
