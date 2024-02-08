import 'package:http/http.dart' as http;
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/parametros/parametros.dart';
import '../../../../utils/variaveis_globais.dart';

final class CarregarStudentFindByIdDatasource implements Datasource<String> {
  @override
  Future<String> call({
    required ParametrosStudentFindById parameters,
  }) async {
    final response = await http.get(Uri.parse("${apiEndpoint}students/${parameters.id}"));

    if (response.statusCode != 200) {
      throw Exception();
    }

    if (response.body == "{}") {
      throw Exception("Student não encontrado!");
    }

    return response.body;
  }
}
