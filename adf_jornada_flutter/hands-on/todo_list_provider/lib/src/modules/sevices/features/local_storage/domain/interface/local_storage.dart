abstract interface class LocalStorage {
  Future<T> read<T>(String key);
  Future<void> write({
    required String id,
    required ({
      String descricao,
      DateTime dataHora,
      bool finalizado,
    }) data,
  });
  Future<void> remove(String key);
}
