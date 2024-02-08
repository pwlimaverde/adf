import 'package:app_cliente_adf_cli/src/features/commands/students/presenter/students_command_presenter.dart';
import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

void main(List<String> arguments) async {
  final command = await studentsCommandPresenter();

  switch (command) {
    case SuccessReturn<Command>():
      CommandRunner('ADF CLI', 'ADF CLI')
        ..addCommand(command.result)
        ..run(arguments);
    case ErrorReturn<Command>():
      print("Deu erro");
  }
}
