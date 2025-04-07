abstract interface class SafeStorage {
  Future<String> read(String key);
  Future<void> write({
    required String key,
    required String data,
  });
  Future<void> remove(String key);
}
