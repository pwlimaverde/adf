import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../entities/products/products.dart';
import '../../../../../utils/parametros/parametros.dart';

final class CarregarProductByNameUsecase
    extends UsecaseBaseCallData<Products, Map<String, dynamic>> {
  CarregarProductByNameUsecase({required super.datasource});

  @override
  Future<ReturnSuccessOrError<Products>> call({
    required ParametrosCarregarProductByName parameters,
  }) async {
    final data = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (data) {
      case SuccessReturn<Map<String, dynamic>>():
        final products = Products.fromMap(data.result);
        return SuccessReturn<Products>(success: products);
      case ErrorReturn<Map<String, dynamic>>():
        return ErrorReturn<Products>(error: parameters.basic.error);
    }
  }
}
