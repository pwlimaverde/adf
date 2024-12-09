import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

///Usecase with external Datasource call
final class WidgetsFlutterBindingUsecase
    extends UsecaseBaseCallData<Unit, WidgetsBinding> {
  WidgetsFlutterBindingUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<Unit>> call(NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<WidgetsBinding>():
        return SuccessReturn(
          success: unit,
        );
      case ErrorReturn<WidgetsBinding>():
        return ErrorReturn(
            error: ErrorGeneric(message: "Erro ao iniciar o serviço WidgetsFlutterBinding"));
    }
  }
}
