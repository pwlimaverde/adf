import 'package:return_success_or_error/return_success_or_error.dart';
import 'dart:async';

import '../../../../utils/parameters.dart';
import '../../domain/interface/local_storage.dart';
import 'config/sqlite_connection.dart';
import 'sqlite_local_storage.dart';

///Datasources
final class SqliteStorageDatasource implements Datasource<LocalStorage> {
  final SqliteConnection _sqliteConnection;

  SqliteStorageDatasource(
    SqliteConnection sqliteConnection,
  ) : _sqliteConnection = sqliteConnection;

  @override
  Future<LocalStorage> call(
    ParametrosUid parameters,
  ) async {
    try {
      final localStorage = SqliteLocalStorage(
        sqliteConnection: _sqliteConnection,
      );
      return localStorage;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
