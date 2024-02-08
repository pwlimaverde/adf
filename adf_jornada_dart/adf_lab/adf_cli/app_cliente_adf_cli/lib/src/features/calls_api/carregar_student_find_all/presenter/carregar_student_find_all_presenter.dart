import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../entities/studends/students.dart';
import '../datasources/carregar_student_find_all_datasource.dart';
import '../domain/usecase/carregar_student_find_all_usecase.dart';

Future<ReturnSuccessOrError<List<Students>>> carregarStudentFindAllPresenter() async {
  final usecaseInstance = CarregarStudentFindAllUsecase(
    datasource: CarregarStudentFindAllDatasource(),
  );

  final data = await usecaseInstance(
    parameters: NoParams(
        basic: ParametersBasic(
      error: ErrorGeneric(message: "Erro ao carregar os Students!"),
      nameFeature: "Carregar All Students",
      showRuntimeMilliseconds: true,
      isIsolate: true,
    )),
  );

  return data;
}
