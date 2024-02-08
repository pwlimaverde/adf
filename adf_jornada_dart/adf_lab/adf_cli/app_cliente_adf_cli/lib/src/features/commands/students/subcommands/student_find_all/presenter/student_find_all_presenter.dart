import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../../entities/studends/students.dart';
import '../../../../../../utils/parametros/parametros.dart';
import '../../../../../calls_api/carregar_student_find_all/presenter/carregar_student_find_all_presenter.dart';
import '../domain/usecase/student_find_all_usecase.dart';

Future<ReturnSuccessOrError<Command>> studentFindAllPresenter() async {
  final usecaseInstance = StudentFindAllUsecase();

  final data = await usecaseInstance(
    parameters: ParametrosCreateCommand(
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao carregar os Students!"),
      ),
      nameCommand: 'findAll',
      descriptionCommand: 'Find all Students',
      runCommand: _runStudent,
    ),
  );

  return data;
}

void _runStudent() async {
  print('Aguarde, buscando alunos...');
  final data = await carregarStudentFindAllPresenter();
  print('Apresentar tambem os cursos? (S OU N)');
  final showCourses = stdin.readLineSync();
  print('-------------------------------------------');
  print('Alunos:');
  print('-------------------------------------------');
  switch (data) {
    case SuccessReturn<List<Students>>():
      for (Students student in data.result) {
        if (showCourses?.toLowerCase() == 's') {
          print(
            '${student.id} - ${student.name} ${student.courses.where((course) => course.isStudent).map((course) => course.name).toList()}',
          );
        } else {
          print(
            '${student.id} - ${student.name}',
          );
        }
      }
    case ErrorReturn<List<Students>>():
  }
}
