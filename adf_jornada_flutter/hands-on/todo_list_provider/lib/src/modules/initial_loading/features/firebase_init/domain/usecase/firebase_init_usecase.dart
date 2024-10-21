import 'package:return_success_or_error/return_success_or_error.dart';


import '../../../../utils/parameters.dart';
import '../model/dart_plugin_registrant_model.dart';

///Usecase with external Datasource call
final class FirebaseInitUsecase
    extends UsecaseBaseCallData<Unit, FirebaseInitModel> {
  FirebaseInitUsecase(super.datasource);


  @override
  Future<ReturnSuccessOrError<Unit>> call(ParametrosFirebaseInit parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<FirebaseInitModel>():
        return SuccessReturn(
          success: unit,
        );
      case ErrorReturn<FirebaseInitModel>():
        return ErrorReturn(
            error: ErrorGeneric(message: "Erro ao iniciar o serviço Firebase"));
    }
  }
}
