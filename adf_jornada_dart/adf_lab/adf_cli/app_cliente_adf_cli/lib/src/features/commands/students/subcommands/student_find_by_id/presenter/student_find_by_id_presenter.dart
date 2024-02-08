import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../../entities/studends/students.dart';
import '../../../../../../utils/parametros/parametros.dart';import '../../../../../calls_api/carregar_student_find_by_id/presenter/carregar_student_find_by_id_presenter.dart';
import '../domain/usecase/student_find_by_id_usecase.dart';

Future<ReturnSuccessOrError<Command>> studentFindByIdPresenter() async {
  final usecaseInstance = StudentFindByIdUsecase();

  final data = await usecaseInstance(
    parameters: ParametrosCreateCommand(
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao carregar o Student!"),
      ),
      nameCommand: 'findById',
      descriptionCommand: 'Find Student By Id',
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
  print('Aguarde, buscando aluno...');
  final id = int.tryParse(idStudent ?? '');
  if (id != null) {
    final data = await carregarStudentFindByIdPresenter(id: id);
    print('Apresentar tambem os cursos? (S OU N)');
    final showCourses = stdin.readLineSync();
    print('-------------------------------------------');
    print('Aluno:');
    print('-------------------------------------------');
    switch (data) {
      case SuccessReturn<Students>():
        final student = data.result;
        if (showCourses?.toLowerCase() == 's') {
          print(
            '${student.id} - ${student.name}',
          );
          print('Idade: ${student.age??'Não Informada'}');
          print('Cursos:');
          print('   ${student.courses.where((course) => course.isStudent).map((course) => course.name).toList()}');
          print('Endereço:');
          print('   ${student.address.street} (${student.address.zipCode})');

        } else {
          print(
            '${student.id} - ${student.name}',
          );
          print('Idade: ${student.age??'Não Informada'}');
          print('Endereço:');
          print('   ${student.address.street} (${student.address.zipCode})');
        }

      case ErrorReturn<Students>():
    }
  }else{
    print("Por favor envie o id do aluno com o comando --id=0 ou -i 0");
  }
}
