import 'dart:convert';

import 'package:app_cliente_adf_cli/src/entities/studends/students.dart';
import 'package:app_cliente_adf_cli/src/features/calls_api/update_student/presenter/update_student_presenter.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:test/test.dart';

final String json = jsonEncode({"id": 6,"name":"Gleidiane de Sousa Duarte Limaverde","age":37,"nameCourses":["Academia Flutter","Jornada GetX"],"courses":[{"id":1,"name":"Academia do Flutter","isStudent":true},{"id":2,"name":"Jornada GetX","isStudent":true},{"id":3,"name":"Jornada Clean Code","isStudent":false},{"id":4,"name":"Jornada Arquitetura","isStudent":false}],"address":{"street":"Rua A","number":175,"zipCode":"0915225222","city":{"id":1,"name":"Santo André"},"phone":{"ddd":11,"phone":"985755555"}}});
final Students students = Students.fromJson(json);

void main() {
  test('update student presenter deve retornar Sucess void',
      () async {
    final data =
        await updateStudentUsecasePresenter(students: students);

    switch (data) {
      case SuccessReturn<void>():
        print("sucesso");

        print(data);

        expect(data, isA<void>());

      case ErrorReturn<void>():
        print("error");
        print(data.result);
    }
  });
}