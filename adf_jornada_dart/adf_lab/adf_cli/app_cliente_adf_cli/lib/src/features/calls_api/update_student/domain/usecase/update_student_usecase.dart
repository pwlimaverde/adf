import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../utils/parametros/parametros.dart';

final class UpdateStudentUsecase extends UsecaseBaseCallData<void, void> {
  UpdateStudentUsecase({required super.datasource});

  @override
  Future<ReturnSuccessOrError<void>> call({
    required ParametrosUpdateStudent parameters,
  }) async {
    
    final data = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return data;
  }
}
