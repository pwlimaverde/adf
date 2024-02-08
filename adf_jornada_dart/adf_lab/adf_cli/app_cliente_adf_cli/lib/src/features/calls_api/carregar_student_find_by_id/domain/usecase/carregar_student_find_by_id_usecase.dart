import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../entities/studends/students.dart';
import '../../../../../utils/parametros/parametros.dart';

final class CarregarStudentFindByIdUsecase
    extends UsecaseBaseCallData<Students, String> {
  CarregarStudentFindByIdUsecase({required super.datasource});

  @override
  Future<ReturnSuccessOrError<Students>> call({
    required ParametrosStudentFindById parameters,
  }) async {
    final data = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (data) {
      case SuccessReturn<String>():
        final students = Students.fromJson(data.result);
        return SuccessReturn<Students>(success: students);
      case ErrorReturn<String>():
        return ErrorReturn<Students>(error: parameters.basic.error);
    }
  }
}
