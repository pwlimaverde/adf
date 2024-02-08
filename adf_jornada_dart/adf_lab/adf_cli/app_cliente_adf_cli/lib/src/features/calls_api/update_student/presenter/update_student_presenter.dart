import 'package:return_success_or_error/return_success_or_error.dart';
import '../../../../entities/studends/students.dart';
import '../../../../utils/parametros/parametros.dart';
import '../datasources/update_student_datasource.dart';
import '../domain/usecase/update_student_usecase.dart';

Future<ReturnSuccessOrError<void>> updateStudentUsecasePresenter({
  required Students students,
}) async {
  final usecaseInstance = UpdateStudentUsecase(
    datasource: UpdateStudentDatasource(),
  );

  final data = await usecaseInstance(
    parameters: ParametrosUpdateStudent(
      students: students,
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao atualizar o Student!"),
        nameFeature: "Update Students By Id",
        showRuntimeMilliseconds: true,
        isIsolate: true,
      ),
    ),
  );

  return data;
}
