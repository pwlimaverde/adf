import '../../../../../core/database/sqlite/sqlite_connection.dart';
import '../../domain/interface/local_storage.dart';

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
  Future<void> write<T>({required String key, required T data}) async {
    if (data is ({DateTime date, String description})) {
      final ({DateTime date, String description}) result = data;

      final conn = await _sqliteConnection.openConnection();
      await conn.insert(
        key,
        {
          'id': null,
          'descricao': result.description,
          'data_hora': result.date.toIso8601String(),
          'finalizado': 0,
        },
      );
    } else {
      throw Exception('Não foi possível salvar o dado, verifique o tipo.');
    }
  }
}
