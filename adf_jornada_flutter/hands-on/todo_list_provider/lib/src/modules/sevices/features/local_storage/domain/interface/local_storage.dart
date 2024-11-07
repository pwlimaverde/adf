abstract interface class LocalStorage {
  Future<List<Map<String, dynamic>>> read({
    String? id,
    ({
      DateTime start,
      DateTime end,
    })? periodo,
  });
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
