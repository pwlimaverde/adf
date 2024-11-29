import '../models/registro.dart';

abstract interface class ExternalStorage {
  Future<Map<String, dynamic>> readDocument(
    Registro registro,
  );
  Future<Stream<Map<String, dynamic>> > readStreamDocument(
    Registro registro,
  );
  Future<List<Map<String, dynamic>>> readCollection(
    Registro registro,
    String colecao,
  );
  Future<Stream<List<Map<String, dynamic>>>> readStreamCollection(
    Registro registro,
    String colecao,
  );
  Future<void> write(Registro registro);
  Future<void> remove(Registro registro);
}
