import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../entities/products/products.dart';
import '../../../../utils/parametros/parametros.dart';
import '../datasources/carregar_product_by_name_datasource.dart';
import '../domain/usecase/carregar_product_by_name_usecase.dart';

Future<ReturnSuccessOrError<Products>> carregarProductByNamePresenter({
  required String name,
}) async {
  final usecaseInstance = CarregarProductByNameUsecase(
    datasource: CarregarProductByNameDatasource(),
  );

  final data = await usecaseInstance(
    parameters: ParametrosCarregarProductByName(
      name: name,
      basic: ParametersBasic(
        error: ErrorGeneric(message: "Erro ao carregar o Product!"),
        nameFeature: "Carregar Product",
        showRuntimeMilliseconds: true,
        isIsolate: true,
      ),
    ),
  );

  return data;
}
