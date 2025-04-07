import 'package:dependencies/dependencies.dart';

final class SafeStorageUsecase extends UsecaseBaseCallData<
    SafeStorage, SafeStorage> {
  SafeStorageUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<SafeStorage>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<SafeStorage>():
        return resultDatacource;

      case ErrorReturn<SafeStorage>():
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Erro ao iniciar o serviço LocalStorage",
          ),
        );
    }
  }
}
