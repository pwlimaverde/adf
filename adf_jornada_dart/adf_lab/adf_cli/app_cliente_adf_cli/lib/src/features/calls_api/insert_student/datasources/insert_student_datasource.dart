import 'package:http/http.dart' as http;
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/parametros/parametros.dart';
import '../../../../utils/variaveis_globais.dart';

final class InsertStudentDatasource implements Datasource<void> {
  @override
  Future<void> call({
    required ParametrosInsertStudent parameters,
  }) async {

    final response = await http.post(
      Uri.parse("${apiEndpoint}students"),
      body: parameters.json,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }

  }
}
