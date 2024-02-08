import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../../utils/parametros/parametros.dart';
import '../../../../../calls_api/insert_student/presenter/insert_student_presenter.dart';
import '../domain/usecase/student_insert_usecase.dart';

Future<ReturnSuccessOrError<Command>> studentInsertPresenter() async {
  final usecaseInstance = StudentInsertUsecase();

  final data = await usecaseInstance(
    parameters: ParametrosCreateCommand(
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao inserir o csv!"),
      ),
      nameCommand: 'insert',
      descriptionCommand: 'Insert Student',
      runCommand: _runStudent,
      args: (
        name: 'file',
        help: 'Path of the cvs file',
        abbr: 'f',
      ),
    ),
  );

  return data;
}

void _runStudent(String? path) async {
  print('Aguarde, Inserindo aluno...');

  if (path != null) {
    final file = File(path).readAsStringSync();

    final data = await insertStudentUsecasePresenter(json: file);

    switch (data) {
      case SuccessReturn<void>():
        print('-------------------------------------------');
        print('Aluno Inserido com sucesso:');
        print('-------------------------------------------');
      case ErrorReturn<void>():
      print('-------------------------------------------');
        print('Erro ao Inserir o Aluno!');
        print('-------------------------------------------');
    }
  } else {
    print(
        "Por favor informe o path com o arquivo json com o comando --file=path ou -f path");
  }
}
