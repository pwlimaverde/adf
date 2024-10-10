// import 'dart:async';
// import 'package:get_storage/get_storage.dart';
// import 'package:return_success_or_error/return_success_or_error.dart';
// import '../domain/interface/local_storage.dart';

// ///Datasources
// final class GetStorageDatasource implements Datasource<LocalStorage> {
//   final GetStorage storage;

//   GetStorageDatasource(this.storage);

//   @override
//   Future<LocalStorage> call(
//     NoParams parameters,
//   ) async {
//     try {
//       final localStorage = GetStorageLocal(storage: storage);
//       return localStorage;
//     } catch (e) {
//       throw parameters.error..message = "$e";
//     }
//   }
// }

// class GetStorageLocal implements LocalStorage {
//   GetStorage storage;
//   GetStorageLocal({
//     required this.storage,
//   });
//   @override
//   Future<dynamic> read(String key) async {
//     final result = await storage.read(key);
//     if (result != null) {
//       return result;
//     } else {
//       throw Exception("Dado local não localizado");
//     }
//   }

//   @override
//   Future<void> remove(String key) async {
//     try {
//       await storage.remove(key);
//     } catch (e) {
//       throw Exception("Dado local não removido");
//     }
//   }

//   @override
//   Future<void> write({
//     required String key,
//     required dynamic data,
//   }) async {
//     try {
//       await storage.write(key, data);
//     } catch (e) {
//       throw Exception("Dado local não escrito");
//     }
//   }
// }
