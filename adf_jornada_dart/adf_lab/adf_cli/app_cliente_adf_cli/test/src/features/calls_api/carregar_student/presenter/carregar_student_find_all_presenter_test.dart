import 'package:app_cliente_adf_cli/src/entities/studends/students.dart';
import 'package:app_cliente_adf_cli/src/features/calls_api/carregar_student_find_all/presenter/carregar_student_find_all_presenter.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:test/test.dart';

void main() {
  test('carregar student find all presenter deve retornar "Lista de Students"', () async {
    final data = await carregarStudentFindAllPresenter();
    

    switch(data){
      case SuccessReturn<List<Students>>():
      print("sucesso");
      for(Students student in data.result){
        print(student.name);
      }
      // print(data.result);
      expect(data.result, isA<List<Students>>());
      expect(data.result[0].name, equals("Rodrigo Rahman"));

      case ErrorReturn<List<Students>>():
      print("error");
      print(data.result);
    }
  });
}