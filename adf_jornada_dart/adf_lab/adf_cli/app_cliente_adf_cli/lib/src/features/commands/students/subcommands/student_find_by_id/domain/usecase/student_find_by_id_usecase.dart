import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../../../entities/command/create_command.dart';
import '../../../../../../../utils/parametros/parametros.dart';

final class StudentFindByIdUsecase extends UsecaseBase<Command> {
  @override
  Future<ReturnSuccessOrError<Command>> call({
    required ParametrosCreateCommand parameters,
  }) async {
    final command = CreateCommand(
      nameCommand: parameters.nameCommand,
      descriptionCommand: parameters.descriptionCommand,
      runCommand: parameters.runCommand,
      args: parameters.args,
    );

    return SuccessReturn(success: command);
  }
}
