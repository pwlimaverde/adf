import 'package:http/http.dart' as http;
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/parametros/parametros.dart';
import '../../../../utils/variaveis_globais.dart';

final class UpdateStudentDatasource implements Datasource<void> {
  @override
  Future<void> call({
    required ParametrosUpdateStudent parameters,
  }) async {

    final response = await http.put(
      Uri.parse("${apiEndpoint}students/${parameters.students.id}"),
      body: parameters.students.toJson(),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }

  }
}
