import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../entities/command/create_command.dart';
import '../../../../../utils/parametros/parametros.dart';

final class StudentsCommandUsecase extends UsecaseBase<Command> {
  @override
  Future<ReturnSuccessOrError<Command>> call({
    required ParametrosCreateCommand parameters,
  }) async {
    final studentCommand = CreateCommand(
      nameCommand: parameters.nameCommand,
      descriptionCommand: parameters.descriptionCommand,
      commands: parameters.commands,
    );
    return SuccessReturn(success: studentCommand);
  }
}
