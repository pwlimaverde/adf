import 'package:dependencies/dependencies.dart';

class SecureSafeStorage implements SafeStorage {
  final FlutterSecureStorage _secureStorage;

  SecureSafeStorage(FlutterSecureStorage secureStorage) : _secureStorage = secureStorage;
  @override
  Future<String> read(String key) async{
    final find = await _secureStorage.read(key: key);
    if (find != null) {
      return find;
    } else {
      throw Exception("Dado safe não localizado");
    }
    }

  @override
  Future<void> remove(String key) => _secureStorage.delete(key: key);

  @override
  Future<void> write({required String key, required String data}) => _secureStorage.write(key: key, value: data);

}
