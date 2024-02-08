import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../entities/studends/students.dart';
import '../../../../utils/parametros/parametros.dart';
import '../datasources/carregar_student_find_by_id_datasource.dart';
import '../domain/usecase/carregar_student_find_by_id_usecase.dart';

Future<ReturnSuccessOrError<Students>> carregarStudentFindByIdPresenter({
  required int id,
}) async {
  final usecaseInstance = CarregarStudentFindByIdUsecase(
    datasource: CarregarStudentFindByIdDatasource(),
  );

  final data = await usecaseInstance(
    parameters: ParametrosStudentFindById(
      id: id,
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao carregar o Student!"),
        nameFeature: "Carregar Students By Id",
        showRuntimeMilliseconds: true,
        isIsolate: true,
      ),
    ),
  );

  return data;
}
