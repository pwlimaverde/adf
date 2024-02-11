import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import '../../utils/migration.dart';
import 'sqlite_migration.dart';

final class SqliteConnection {
  static const _VERSON = 1;
  static const _DATABASE_NAME = 'TODO_LIST_PROVIDER';
  final _lock = Lock();
  Database? _db;

  static SqliteConnection? _instance;
  SqliteConnection._();
  factory SqliteConnection() {
    _instance ??= SqliteConnection._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, _DATABASE_NAME);
    if (_db == null) {
      await _lock.synchronized(() async {
        _db ??= await openDatabase(
          databasePathFinal,
          version: _VERSON,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDowgrade,
        );
      });
    }
    return _db!;
  }

  void closeConnection(){
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db,)async{
    await db.execute('PRAGMA foreign_keys = ON');
  }
  Future<void> _onCreate(Database db, int version,)async{
    final bath = db.batch();
    final migrations = SqliteMigration().getCreateMigration();
    for (Migration migration in migrations) {
      migration.create(bath);
    }

    bath.commit();
  }
  Future<void> _onUpgrade(Database db, int oldVersion, int version,)async{
    final bath = db.batch();
    final migrations = SqliteMigration().getUpdateMigration(oldVersion);
    for (Migration migration in migrations) {
      migration.update(bath);
    }

    bath.commit();
  }
  Future<void> _onDowgrade(Database db, int oldVersion, int version,)async{}

}
