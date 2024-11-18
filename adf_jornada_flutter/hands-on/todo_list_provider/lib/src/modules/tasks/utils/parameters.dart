import 'package:return_success_or_error/return_success_or_error.dart';

import 'erros.dart';

final class ParametrosCreateTasks implements ParametersReturnResult {
  final String descricao;
  final DateTime dataHora;
  @override
  final TaskError error;

  ParametrosCreateTasks({
    required this.descricao,
    required this.dataHora,
    required this.error,
  });
}