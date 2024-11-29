// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:return_success_or_error/return_success_or_error.dart';
// import 'dart:async';

// import '../../domain/interface/local_storage.dart';

// ///Datasources
// final class HiveStorageDatasource implements Datasource<LocalStorage> {
//   HiveStorageDatasource();

//   @override
//   Future<LocalStorage> call(
//     NoParams parameters,
//   ) async {
//     try {
//       final localStorage = HiveStorageLocal();
//       return localStorage;
//     } catch (e) {
//       throw parameters.error..message = "$e";
//     }
//   }
// }

// class HiveStorageLocal implements LocalStorage {
//   HiveStorageLocal();
//   @override
//   Future<T> read<T>(String key) async {
//     final box = await _hiveInit();
//     final find = await box.get(key);
//     if (find != null && find is T) {
//       final T result = find;
//       return result;
//     } else {
//       throw Exception("Dado local não localizado");
//     }
//   }

//   @override
//   Future<void> remove(String key) async {
//     try {
//       final box = await _hiveInit();
//       box.delete(key);
//     } catch (e) {
//       throw Exception("Dado local não removido");
//     }
//   }

//   @override
//   Future<void> write({
//     required String id,
//     required ({
//       String descricao,
//       DateTime dataHora,
//       bool finalizado,
//     }) data,
//   }) async {
//     try {
//       final box = await _hiveInit();
//       box.put(id, data);
//     } catch (e) {
//       throw Exception("Dado local não escrito");
//     }
//   }

//   Future<Box<dynamic>> _hiveInit() async {
//     final dir = await getApplicationDocumentsDirectory();
//     Hive.defaultDirectory = dir.path;
//     return Hive.box<String>(name: "bdSistem_hive");
//   }
// }
