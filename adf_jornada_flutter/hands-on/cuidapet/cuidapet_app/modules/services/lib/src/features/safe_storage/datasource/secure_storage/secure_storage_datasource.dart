import 'package:dependencies/dependencies.dart';
import 'dart:async';

import 'secure_safe_storage.dart';

///Datasources
final class SecureStorageDatasource implements Datasource<SafeStorage> {
  final FlutterSecureStorage _secureStorage;

  SecureStorageDatasource(FlutterSecureStorage secureStorage) : _secureStorage = secureStorage;

  @override
  Future<SafeStorage> call(
    NoParams parameters,
  ) async {
    try {
      final safeStorage = SecureSafeStorage(_secureStorage);
      return safeStorage;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
