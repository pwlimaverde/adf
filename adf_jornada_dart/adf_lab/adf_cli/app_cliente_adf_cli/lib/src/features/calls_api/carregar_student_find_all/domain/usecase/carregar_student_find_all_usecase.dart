import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../entities/studends/students.dart';

final class CarregarStudentFindAllUsecase
    extends UsecaseBaseCallData<List<Students>, List<dynamic>> {
  CarregarStudentFindAllUsecase({required super.datasource});

  @override
  Future<ReturnSuccessOrError<List<Students>>> call({
    required NoParams parameters,
  }) async {
    final data = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (data) {
      case SuccessReturn<List<dynamic>>():
        final students = data.result.map<Students>((student) => Students.fromMap(student)).toList();
        return SuccessReturn<List<Students>>(success: students);
      case ErrorReturn<List<dynamic>>():
        return ErrorReturn<List<Students>>(error: parameters.basic.error);
    }
  }
}
