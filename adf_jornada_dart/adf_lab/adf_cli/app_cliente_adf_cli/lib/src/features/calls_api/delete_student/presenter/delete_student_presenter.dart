import 'package:return_success_or_error/return_success_or_error.dart';
import '../../../../utils/parametros/parametros.dart';
import '../datasources/delete_student_datasource.dart';
import '../domain/usecase/delete_student_usecase.dart';

Future<ReturnSuccessOrError<void>> deleteStudentPresenter({
  required int id,
}) async {
  final usecaseInstance = DeleteStudentUsecase(
    datasource: DeleteStudentDatasource(),
  );

  final data = await usecaseInstance(
    parameters: ParametrosStudentFindById(
      id: id,
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao deletar o Student!"),
        nameFeature: "Deletar Students By Id",
        showRuntimeMilliseconds: true,
        isIsolate: true,
      ),
    ),
  );

  return data;
}
