import 'package:app_cliente_adf_cli/src/features/calls_api/delete_student/presenter/delete_student_presenter.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:test/test.dart';

void main() {
  test('delete student presenter deve retornar voide',
      () async {
    final data = await deleteStudentPresenter(id: 7);

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

  test('delete student presenter deve retornar ErrorGeneric',
      () async {
    final data = await deleteStudentPresenter(id: 25645644545);

    switch (data) {
      case SuccessReturn<void>():
        print("sucesso");

        print(data);

      case ErrorReturn<void>():
        print("error");
        print(data.result);
        expect(data.result, isA<ErrorGeneric>());
    }
  });
}