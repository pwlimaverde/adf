import 'package:sqflite/sqflite.dart';

import '../interfaces/migration.dart';
import '../utilite/db_info.dart';





class MigrationV1 implements Migration {
  final String _uid;
  MigrationV1({required String uid}):_uid =uid;
  @override
  void call(Batch bath) {
    bath.execute('''
      CREATE TABLE IF NOT EXISTS todo_${_uid.replaceAll('-', '_')}(
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
