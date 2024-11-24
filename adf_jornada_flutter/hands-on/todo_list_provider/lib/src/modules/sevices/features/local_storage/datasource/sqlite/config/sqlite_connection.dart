import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import 'interfaces/migration.dart';
import 'utilite/db_info.dart';
import 'migration/migration_v1.dart';

final class SqliteConnection {
  final _lock = Lock();
  static const _dbInfo = DbInfo.v1;
  Database? _db;

  static SqliteConnection? _instance;
  SqliteConnection._();
  factory SqliteConnection() {
    _instance ??= SqliteConnection._();
    return _instance!;
  }

  Future<Database> openConnection(String uid) async {
    final List<Migration> migrations = [
      MigrationV1(uid: uid),
    ];
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, _dbInfo.name);
    if (_db == null) {
      await _lock.synchronized(() async {
        _db ??= await openDatabase(
          databasePathFinal,
          version: _dbInfo.version,
          onConfigure: _onConfigure,
          onCreate: (db, version) => _onCreate(db, version, migrations),
          onUpgrade: (db, oldVersion, version) =>
              _onUpgrade(db, oldVersion, version, migrations),
          onDowngrade: _onDowgrade,
          onOpen: (db) => _onOpen(db, migrations),
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
  Future<void> _onOpen(
    Database db,
    List<Migration> migrations,
  ) async {
    final bath = db.batch();
    for (Migration migration in migrations) {
      migration(bath);
    }

    bath.commit();
  }

  Future<void> _onCreate(
    Database db,
    int version,
    List<Migration> migrations,
  ) async {
    final bath = db.batch();
    for (Migration migration in migrations) {
      migration(bath);
    }

    bath.commit();
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int version,
    List<Migration> migrations,
  ) async {
    final bath = db.batch();

    for (Migration migration in migrations) {
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
