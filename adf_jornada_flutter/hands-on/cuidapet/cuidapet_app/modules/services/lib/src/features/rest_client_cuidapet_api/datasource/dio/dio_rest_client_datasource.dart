import 'dart:async';
import 'package:dependencies/dependencies.dart';
import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import '../../domain/interface/rest_client_cuidapet.dart';
import 'config/dio_connection.dart';
import 'dio_rest_client_cuidapet_api.dart';

///Datasources
final class DioRestClientDatasource implements Datasource<RestClientCuidaPet> {
  final DioConnection _dioConnection;


  DioRestClientDatasource(
    DioConnection dioConnection
  ):_dioConnection = dioConnection;
  @override
  Future<RestClientCuidaPet> call(
    ParametrosRestClientResponse parameters,
  ) async {
    try {
      final restClient = DioRestCuidaPetApiClient(_dioConnection);
      return restClient;
    }on RestClientResponseError catch (e) {
      throw parameters.error = e;
    } catch(e){
      throw parameters.error..message = "$e";

    }
  }
}
