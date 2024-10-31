import '../../domain/interface/local_storage.dart';
import 'config/sqlite_connection.dart';

final class SqliteLocalStorage implements LocalStorage {
  final SqliteConnection _sqliteConnection;

  SqliteLocalStorage(
    SqliteConnection sqliteConnection,
  ) : _sqliteConnection = sqliteConnection;

  @override
  Future<T> read<T>(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> remove(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> write({
    required String id,
    required ({
      String descricao,
      DateTime dataHora,
      bool finalizado,
    }) data,
  }) async {
    if (id == '') {
      final conn = await _sqliteConnection.openConnection();
      await conn.insert(
        'todo',
        {
          'id': null,
          'descricao': data.descricao,
          'data_hora': data.dataHora.toIso8601String(),
          'finalizado': 0,
        },
      );
    } else {
      throw Exception('Não foi possível salvar o dado, verifique o tipo.');
    }
  }
}
