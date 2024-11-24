abstract interface class LocalStorage {
  Future<List<Map<String, dynamic>>> read({
    required String uid,
    int? id,
    ({
      DateTime start,
      DateTime end,
    })? periodo,
  });
  Future<void> write({
    required String uid,
    required int id,
    required ({
      String descricao,
      DateTime dataHora,
      bool finalizado,
    }) data,
  });
  Future<void> remove(String key);
}
