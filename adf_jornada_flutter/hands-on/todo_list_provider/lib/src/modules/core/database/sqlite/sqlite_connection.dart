import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import 'interfaces/migration.dart';
import 'utilite/db_info.dart';
import 'migration/migration_v1.dart';
import 'migration/migration_v2.dart';
import 'migration/migration_v3.dart';
import 'migration/migration_v4.dart';



final class SqliteConnection {
  final _lock = Lock();
  static const _dbInfo = DbInfo.v4;
  final List<Migration> _migrations = [
    MigrationV1(),
    MigrationV2(),
    MigrationV3(),
    MigrationV4(),
  ];
  Database? _db;

  static SqliteConnection? _instance;
  SqliteConnection._();
  factory SqliteConnection() {
    _instance ??= SqliteConnection._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, _dbInfo.name);
    if (_db == null) {
      await _lock.synchronized(() async {
        _db ??= await openDatabase(
          databasePathFinal,
          version: _dbInfo.version,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDowgrade,
        );
      });
    }
    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(
    Database db,
  ) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    final bath = db.batch();
    for (Migration migration in _migrations) {
      migration(bath);
    }

    bath.commit();
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int version,
  ) async {
    final bath = db.batch();

    for (Migration migration in _migrations) {
      if (migration.dbInfo.version > oldVersion) {}
      migration(bath);
    }

    bath.commit();
  }

  Future<void> _onDowgrade(
    Database db,
    int oldVersion,
    int version,
  ) async {}
}
