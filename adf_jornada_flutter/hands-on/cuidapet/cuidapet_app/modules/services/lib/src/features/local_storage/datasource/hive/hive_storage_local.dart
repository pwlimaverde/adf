import 'package:dependencies/dependencies.dart';

class HiveStorageLocal implements LocalStorage {
  @override
  Future<T> read<T>(String key) async {
    final box = await _hiveInit<T>();
    final find = box.get(key);
    if (find != null) {
      return find;
    } else {
      throw Exception("Dado local não localizado");
    }
  }

  @override
  Future<void> remove<T>(String key) async {
    try {
      final box = await _hiveInit<T>();
      final confirm = box.delete(key);
      if(!confirm){
        throw Exception("Dado local não localizado para remoção");
      }
    } catch (e) {
      throw Exception("Dado local não removido - $e");
    }
  }

  @override
  Future<void> write<T>({required String key, required T data}) async {
    try {
      final box = await _hiveInit<T>();
      box.put(key, data);
    } catch (e) {
      throw Exception("Dado local não escrito");
    }
  }

  Future<Box<T>> _hiveInit<T>() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    return Hive.box<T>(name: "bdSistem_hive_${T.toString()}");
  }
}
