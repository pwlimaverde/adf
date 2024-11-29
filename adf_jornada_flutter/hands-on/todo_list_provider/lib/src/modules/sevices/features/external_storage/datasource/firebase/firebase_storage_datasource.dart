import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../domain/interface/external_storage.dart';
import 'firebase_external_storage.dart';

///Datasources
final class FirebaseStorageDatasource implements Datasource<ExternalStorage> {
  FirebaseFirestore instanceFirebase;

  FirebaseStorageDatasource(
    this.instanceFirebase,
  );
  @override
  Future<ExternalStorage> call(
    NoParams parameters,
  ) async {
    try {
      final externalStorage = FirebaseExternalStorage(
        instanceFirebase: instanceFirebase,
      );
      return externalStorage;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
