import 'dart:async';
import 'package:dependencies/dependencies.dart';
import 'firebase_external_storage.dart';

///Datasources
final class FirebaseStorageDatasource implements Datasource<ExternalStorage> {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  FirebaseStorageDatasource({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseStorage firebaseStorage,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseStorage = firebaseStorage;
  @override
  Future<ExternalStorage> call(
    NoParams parameters,
  ) async {
    try {
      final externalStorage = FirebaseExternalStorage(
        instanceFirebase: _firebaseFirestore,
        instanceStorage: _firebaseStorage,
      );
      return externalStorage;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
