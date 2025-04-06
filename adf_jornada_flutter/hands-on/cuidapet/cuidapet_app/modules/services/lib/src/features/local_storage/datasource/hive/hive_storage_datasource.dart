import 'package:dependencies/dependencies.dart';
import 'dart:async';

import 'hive_storage_local.dart';

///Datasources
final class HiveStorageDatasource implements Datasource<LocalStorage> {
  HiveStorageDatasource();

  @override
  Future<LocalStorage> call(
    NoParams parameters,
  ) async {
    try {
      final localStorage = HiveStorageLocal();
      return localStorage;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
