import 'package:firebase_core/firebase_core.dart';
import 'package:return_success_or_error/return_success_or_error.dart';


import '../../../utils/parameters.dart';
import '../domain/model/dart_plugin_registrant_model.dart';

///Datasources
final class FirebaseInitDatasource
    implements Datasource<FirebaseInitModel> {
  @override
  Future<FirebaseInitModel> call(
    ParametrosFirebaseInit parameters,
  ) async {
    try {
      await Firebase.initializeApp(
      options: parameters.options,
    );
      return FirebaseInitModel();
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
