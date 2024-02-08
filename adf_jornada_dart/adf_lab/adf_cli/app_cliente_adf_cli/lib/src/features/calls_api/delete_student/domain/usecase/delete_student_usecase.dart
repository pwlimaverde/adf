import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../utils/parametros/parametros.dart';

final class DeleteStudentUsecase extends UsecaseBaseCallData<void, void> {
  DeleteStudentUsecase({required super.datasource});

  @override
  Future<ReturnSuccessOrError<void>> call({
    required ParametrosStudentFindById parameters,
  }) async {
    final data = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return data;
  }
}
