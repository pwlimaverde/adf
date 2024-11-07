import '../../domain/interface/local_storage.dart';
import 'config/sqlite_connection.dart';

final class SqliteLocalStorage implements LocalStorage {
  final SqliteConnection _sqliteConnection;

  SqliteLocalStorage(
    SqliteConnection sqliteConnection,
  ) : _sqliteConnection = sqliteConnection;

  @override
  Future<List<Map<String, dynamic>>> read({
    String? id,
    ({
      DateTime start,
      DateTime end,
    })? periodo,
  }) async {
    final conn = await _sqliteConnection.openConnection();
    if (periodo != null) {
      final startFilter = DateTime(
        periodo.start.year,
        periodo.start.month,
        periodo.start.day,
        0,
        0,
        0,
      );
      final endFilter = DateTime(
        periodo.end.year,
        periodo.end.month,
        periodo.end.day,
        23,
        59,
        59,
      );
      final result = await conn.rawQuery(
        '''
        SELECT * 
        FROM todo
        WHERE data_hora BETWEEN ? AND ?
        ORDER BY data_hora
      ''',
        [
          startFilter.toIso8601String(),
          endFilter.toIso8601String(),
        ],
      );
      return result;
    } else {
      throw Exception('Não foi possível ler o dado');
    }
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
