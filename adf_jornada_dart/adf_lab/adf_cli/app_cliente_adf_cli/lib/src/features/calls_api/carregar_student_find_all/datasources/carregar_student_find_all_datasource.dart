import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/variaveis_globais.dart';

final class CarregarStudentFindAllDatasource
    implements Datasource<List<dynamic>> {
  @override
  Future<List<dynamic>> call({
    required NoParams parameters,
  }) async {
    final response = await http
        .get(Uri.parse("${apiEndpoint}students"));

    if (response.statusCode != 200) {
      throw Exception();
    }
    final data = jsonDecode(response.body) as List<dynamic>;

    if (data.isEmpty) {
      throw Exception("Produto não encontrado!");
    }
    
    return data;

  }
}
