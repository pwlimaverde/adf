import 'package:return_success_or_error/return_success_or_error.dart';
import '../../../../utils/parametros/parametros.dart';
import '../datasources/insert_student_datasource.dart';
import '../domain/usecase/insert_student_usecase.dart';

Future<ReturnSuccessOrError<void>> insertStudentUsecasePresenter({
  required String json,
}) async {
  final usecaseInstance = InsertStudentUsecase(
    datasource: InsertStudentDatasource(),
  );

  final data = await usecaseInstance(
    parameters: ParametrosInsertStudent(
      json: json,
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao inserir o Student!"),
        nameFeature: "Insert Students By Id",
        showRuntimeMilliseconds: true,
        isIsolate: true,
      ),
    ),
  );

  return data;
}
