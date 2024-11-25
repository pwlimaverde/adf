import '../../domain/interface/local_storage.dart';
import 'config/sqlite_connection.dart';

final class SqliteLocalStorage implements LocalStorage {
  final SqliteConnection _sqliteConnection;

  SqliteLocalStorage({
    required SqliteConnection sqliteConnection,
  })  : _sqliteConnection = sqliteConnection;

  @override
  Future<List<Map<String, dynamic>>> read({
    required String uid,
    int? id,
    ({
      DateTime start,
      DateTime end,
    })? periodo,
  }) async {
    final conn = await _sqliteConnection.openConnection(uid);
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
        FROM todo_${uid.replaceAll('-', '_')}
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
  Future<void> remove({required int id, required String uid}) async{
    final conn = await _sqliteConnection.openConnection(uid);
    await conn.rawDelete('''
      DELETE FROM todo_${uid.replaceAll('-', '_')}
      WHERE id = ?
    ''', [id]);
  }

  @override
  Future<void> write({
    required int id,
    required String uid,
    required ({
      String descricao,
      DateTime dataHora,
      bool finalizado,
    }) data,
  }) async {
    final conn = await _sqliteConnection.openConnection(uid);
    if (id == 0) {
      await conn.insert(
        'todo_${uid.replaceAll('-', '_')}',
        {
          'id': null,
          'descricao': data.descricao,
          'data_hora': data.dataHora.toIso8601String(),
          'finalizado': 0,
        },
      );
    } else {
      final check = data.finalizado ? 1 : 0;
      conn.rawUpdate('''
        UPDATE todo_${uid.replaceAll('-', '_')}
        SET descricao = ?, data_hora = ?, finalizado = ?
        WHERE id = ?
      ''', [
        data.descricao,
        data.dataHora.toIso8601String(),
        check,
        id,
      ]);
    }
  }
}
