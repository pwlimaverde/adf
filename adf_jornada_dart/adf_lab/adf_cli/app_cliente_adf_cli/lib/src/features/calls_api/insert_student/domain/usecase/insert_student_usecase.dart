import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../utils/parametros/parametros.dart';

final class InsertStudentUsecase extends UsecaseBaseCallData<void, void> {
  InsertStudentUsecase({required super.datasource});

  @override
  Future<ReturnSuccessOrError<void>> call({
    required ParametrosInsertStudent parameters,
  }) async {
    
    final data = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return data;
  }
}
