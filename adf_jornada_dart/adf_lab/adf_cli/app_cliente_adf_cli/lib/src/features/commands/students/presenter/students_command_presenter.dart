import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/parametros/parametros.dart';
import '../domain/usecase/students_command_usecase.dart';
import '../subcommands/student_delete/presenter/student_delete_presenter.dart';
import '../subcommands/student_find_all/presenter/student_find_all_presenter.dart';
import '../subcommands/student_find_by_id/presenter/student_find_by_id_presenter.dart';
import '../subcommands/student_insert/presenter/student_insert_presenter.dart';

Future<ReturnSuccessOrError<Command>> studentsCommandPresenter() async {
  List<Command> commands = [];
  final usecaseInstance = StudentsCommandUsecase();
  final subcommandFindAll = await studentFindAllPresenter();

  switch (subcommandFindAll) {
    case SuccessReturn<Command>():
      commands.add(subcommandFindAll.result);
    case ErrorReturn<Command>():
      print(subcommandFindAll.result);
  }

  final subcommandFindById = await studentFindByIdPresenter();

  switch (subcommandFindById) {
    case SuccessReturn<Command>():
      commands.add(subcommandFindById.result);
    case ErrorReturn<Command>():
      print(subcommandFindById.result);
  }

  final subcommandInsert = await studentInsertPresenter();

  switch (subcommandInsert) {
    case SuccessReturn<Command>():
      commands.add(subcommandInsert.result);
    case ErrorReturn<Command>():
      print(subcommandInsert.result);
  }

  final subcommandDelete = await studentDeletePresenter();

  switch (subcommandDelete) {
    case SuccessReturn<Command>():
      commands.add(subcommandDelete.result);
    case ErrorReturn<Command>():
      print(subcommandDelete.result);
  }

  final data = await usecaseInstance(
    parameters: ParametrosCreateCommand(
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao carregar o Product!"),
        nameFeature: "Carregar Product",
      ),
      nameCommand: 'students',
      descriptionCommand: 'Students Operations',
      commands: commands,
    ),
  );

  return data;
}
