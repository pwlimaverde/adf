import 'package:app_cliente_adf_cli/src/entities/studends/students.dart';
import 'package:app_cliente_adf_cli/src/features/calls_api/carregar_student_find_by_id/presenter/carregar_student_find_by_id_presenter.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:test/test.dart';

void main() {
  test('carregar student find by id presenter deve retornar "Rodrigo Rahman"',
      () async {
    final data = await carregarStudentFindByIdPresenter(id: 0);

    switch (data) {
      case SuccessReturn<Students>():
        print("sucesso");

        print(data.result.name);

        expect(data.result, isA<Students>());
        expect(data.result.name, equals("Rodrigo Rahman"));

      case ErrorReturn<Students>():
        print("error");
        print(data.result);
    }
  });

  test('carregar student find by id presenter deve retornar ErrorGeneric',
      () async {
    final data = await carregarStudentFindByIdPresenter(id: 25645644545);

    switch (data) {
      case SuccessReturn<Students>():
        print("sucesso");

        print(data.result.name);

      case ErrorReturn<Students>():
        print("error");
        print(data.result);
        expect(data.result, isA<ErrorGeneric>());
    }
  });
}
