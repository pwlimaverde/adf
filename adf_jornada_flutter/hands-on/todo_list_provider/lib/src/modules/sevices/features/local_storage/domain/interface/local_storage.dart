abstract interface class LocalStorage {
  Future<T> read<T>(String key);
  Future<void> write<T>({
    required String key,
    required T data,
  });
  Future<void> remove(String key);
}
