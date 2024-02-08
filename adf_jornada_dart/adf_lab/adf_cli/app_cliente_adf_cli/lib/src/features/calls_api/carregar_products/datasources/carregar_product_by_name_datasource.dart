import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/parametros/parametros.dart';
import '../../../../utils/variaveis_globais.dart';

final class CarregarProductByNameDatasource
    implements Datasource<Map<String, dynamic>> {
  @override
  Future<Map<String, dynamic>> call({
    required ParametrosCarregarProductByName parameters,
  }) async {
    final response = await http
        .get(Uri.parse("${apiEndpoint}products?name=${parameters.name}"));

    if (response.statusCode != 200) {
      throw Exception();
    }
    final data = jsonDecode(response.body);

    if (data.isEmpty) {
      throw Exception("Produto não encontrado!");
    }

    return data.first;

  }
}
