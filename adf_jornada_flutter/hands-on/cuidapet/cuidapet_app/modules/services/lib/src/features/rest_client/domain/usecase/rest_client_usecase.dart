import 'package:dependencies/dependencies.dart';
import '../interface/rest_client.dart';

final class ExternalStorageUsecase extends UsecaseBaseCallData<
    ExternalStorage, ExternalStorage> {
  ExternalStorageUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<ExternalStorage>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<ExternalStorage>():
        final result = resultDatacource.result;
        return SuccessReturn(
          success: result,
        );

      case ErrorReturn<ExternalStorage>():
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Erro ao iniciar o serviço LocalStorage",
          ),
        );
    }
  }
}
