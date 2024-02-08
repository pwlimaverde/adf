import 'dart:convert';

import 'package:app_cliente_adf_cli/src/features/calls_api/insert_student/presenter/insert_student_presenter.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:test/test.dart';

final String json = jsonEncode({"name":"Leticia Limaverde","age":37,"nameCourses":["Academia Flutter","Jornada GetX"],"courses":[{"id":1,"name":"Academia do Flutter","isStudent":true},{"id":2,"name":"Jornada GetX","isStudent":true},{"id":3,"name":"Jornada Clean Code","isStudent":false},{"id":4,"name":"Jornada Arquitetura","isStudent":false}],"address":{"street":"Rua A","number":175,"zipCode":"0915225222","city":{"id":1,"name":"Santo André"},"phone":{"ddd":11,"phone":"985755555"}}});

void main() {
  test('carregar student find by id presenter deve retornar Sucess void',
      () async {
    final data =
        await insertStudentUsecasePresenter(json: json);

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
