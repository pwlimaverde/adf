import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../entities/studends/students.dart';

final class ParametrosCarregarProductByName implements ParametersReturnResult {
  final String name;
  @override
  final ParametersBasic basic;

  ParametrosCarregarProductByName({
    required this.name,
    required this.basic,
  });
}

final class ParametrosStudentFindById implements ParametersReturnResult {
  final int id;
  @override
  final ParametersBasic basic;

  ParametrosStudentFindById({
    required this.id,
    required this.basic,
  });
}

final class ParametrosInsertStudent implements ParametersReturnResult {
  final String json;
  @override
  final ParametersBasic basic;

  ParametrosInsertStudent({
    required this.json,
    required this.basic,
  });
}

final class ParametrosUpdateStudent implements ParametersReturnResult {
  final Students students;
  @override
  final ParametersBasic basic;

  ParametrosUpdateStudent({
    required this.students,
    required this.basic,
  });
}

final class ParametrosCreateCommand implements ParametersReturnResult {
  final String nameCommand;
  final String descriptionCommand;
  final List<Command>? commands;
  final Function? runCommand;
  final ({String name, String help, String abbr})? args;
  @override
  final ParametersBasic basic;

  ParametrosCreateCommand({
    required this.nameCommand,
    required this.descriptionCommand,
    required this.basic,
    this.commands,
    this.runCommand,
    this.args,
  });
}
