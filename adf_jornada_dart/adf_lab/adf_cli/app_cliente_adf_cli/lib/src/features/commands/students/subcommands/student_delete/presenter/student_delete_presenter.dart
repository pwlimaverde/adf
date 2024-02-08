import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../../entities/studends/students.dart';
import '../../../../../../utils/parametros/parametros.dart';
import '../../../../../calls_api/carregar_student_find_by_id/presenter/carregar_student_find_by_id_presenter.dart';
import '../../../../../calls_api/delete_student/presenter/delete_student_presenter.dart';
import '../domain/usecase/student_delete_usecase.dart';

Future<ReturnSuccessOrError<Command>> studentDeletePresenter() async {
  final usecaseInstance = StudentDeleteUsecase();

  final data = await usecaseInstance(
    parameters: ParametrosCreateCommand(
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao deletar o Student!"),
      ),
      nameCommand: 'delete',
      descriptionCommand: 'Delete Student',
      runCommand: _runStudent,
      args: (
        name: 'id',
        help: 'Student Id',
        abbr: 'i',
      ),
    ),
  );

  return data;
}

void _runStudent(String? idStudent) async {
  print('Aguarde, deletando aluno...');
  final id = int.tryParse(idStudent ?? '');
  if (id != null) {
    final aluno = await carregarStudentFindByIdPresenter(id: id);
    switch (aluno) {
      case SuccessReturn<Students>():
        print(
          'Deseja realmente deletar o aluno ${aluno.result.name}? (S OU N)',
        );
        final showCourses = stdin.readLineSync();
        if (showCourses?.toLowerCase() == 's') {
          final data = await deleteStudentPresenter(id: id);
          switch (data) {
            case SuccessReturn<void>():
              print('-------------------------------------------');
              print('Aluno ${aluno.result.name} deletado com sucesso!');
              print('-------------------------------------------');
            case ErrorReturn<void>():
              print('-------------------------------------------');
              print('E#rro ao tentar deletar o Aluno ${aluno.result.name}!');
              print('-------------------------------------------');
          }
        } else {
          print('-------------------------------------------');
          print('Aluno ${aluno.result.name} não deletado!');
          print('-------------------------------------------');
        }

      case ErrorReturn<Students>():
        print("Erro ao tentar deletar o aluno!");
    }
  } else {
    print("Por favor envie o id do aluno com o comando --id=0 ou -i 0");
  }
}
