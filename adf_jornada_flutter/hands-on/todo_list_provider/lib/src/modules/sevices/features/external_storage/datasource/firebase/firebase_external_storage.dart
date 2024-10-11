import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/interface/external_storage.dart';
import '../../domain/models/registro.dart';

class FirebaseExternalStorage implements ExternalStorage {
  final FirebaseFirestore _instanceFirebase;

  FirebaseExternalStorage({required FirebaseFirestore instanceFirebase}): _instanceFirebase = instanceFirebase;

  @override
  Future<Map<String, dynamic>> readDocument(
    Registro registro,
  ) async {
    try {
      var caminho =
          _instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }

      final snapshot = await caminho.get();
      final data = snapshot.data() ?? <String, dynamic>{};
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Stream<Map<String, dynamic>>> readStreamDocument(
    Registro registro,
  ) async {
    try {
      var caminho =
          _instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }

      final snapshot = caminho.snapshots();
      final data = snapshot.map((data) => data.data() ?? <String, dynamic>{});
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> readCollection(
    Registro registro,
    String colecao,
  ) async {
    try {
      var caminho =
          _instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }

      var collection = caminho.collection(colecao);

      final snapshot = await collection.get();
      final data = snapshot.docs.map((data) => data.data()).toList();

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Stream<List<Map<String, dynamic>>>> readStreamCollection(
    Registro registro,
    String colecao,
  ) async {
    try {
      var caminho =
          _instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }

      var collection = caminho.collection(colecao);

      final snapshot = collection.snapshots();
      final data =
          snapshot.map((data) => data.docs.map((data) => data.data()).toList());
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> remove(Registro registro) async {
    try {
      var caminho =
          _instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }

      await caminho.delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> write(Registro registro) async {
    try {
      var caminho =
          _instanceFirebase.collection(registro.colecao).doc(registro.documento);
      if (registro.dados != null) {
        caminho.set(registro.dados!);
      }

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        if (subData.dados != null) {
          caminho.set(subData.dados!);
        }
        subData = subData.subColecao;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
