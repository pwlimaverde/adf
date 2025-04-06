import 'package:dependencies/dependencies.dart';
import '../../../../utils/parameters.dart';
import '../interface/rest_client_cuidapet.dart';

final class RestClientCuidapetApiUsecase extends UsecaseBaseCallData<
    RestClientCuidaPet, RestClientCuidaPet> {
  RestClientCuidapetApiUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<RestClientCuidaPet>> call(
      ParametrosRestClientResponse parameters) async {
    return await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );
  }
}
