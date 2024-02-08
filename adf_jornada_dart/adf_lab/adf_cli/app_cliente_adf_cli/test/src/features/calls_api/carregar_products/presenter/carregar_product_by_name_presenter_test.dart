import 'package:app_cliente_adf_cli/src/entities/products/products.dart';
import 'package:app_cliente_adf_cli/src/features/calls_api/carregar_products/presenter/carregar_product_by_name_presenter.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:test/test.dart';

void main() {
  test('carregar product by name presenter deve retornar "Academia do flutter"', () async {
    final data = await carregarProductByNamePresenter(name: 'Academia do flutter');
    

    switch(data){
      case SuccessReturn<Products>():
      print("sucesso");
      print(data.result.name);
      print(data.result.id);
      expect(data.result.id, equals(0));
      expect(data.result.name, equals("Academia do flutter"));

      case ErrorReturn<Products>():
      print("error");
      print(data.result);
    }
  });

  test('carregar product by name presenter deve retornar "Jornada Dart"', () async {
    final data = await carregarProductByNamePresenter(name: 'Jornada Dart');
    

    switch(data){
      case SuccessReturn<Products>():
      print("sucesso");
      print(data.result.name);
      print(data.result.id);
      expect(data.result.id, equals(1));
      expect(data.result.name, equals("Jornada Dart"));

      case ErrorReturn<Products>():
      print("error");
      print(data.result);
    }
  });

  test('carregar product by name presenter deve retornar ErrorGeneric', () async {
    final data = await carregarProductByNamePresenter(name: 'Java');
    

    switch(data){
      case SuccessReturn<Products>():
      print("sucesso");
      print(data.result.name);
      print(data.result.id);

      case ErrorReturn<Products>():
      print("error");
      print(data.result);
      expect(data.result, isA<ErrorGeneric>());
    }
  });
}