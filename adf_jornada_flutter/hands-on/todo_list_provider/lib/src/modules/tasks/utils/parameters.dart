import 'package:return_success_or_error/return_success_or_error.dart';

import 'erros.dart';

final class ParametrosCreateTasks implements ParametersReturnResult {
  final String uid;
  final String descricao;
  final DateTime dataHora;
  @override
  final TaskError error;

  ParametrosCreateTasks({
    required this.uid,
    required this.descricao,
    required this.dataHora,
    required this.error,
  });
}

final class ParametrosUpdateTasks implements ParametersReturnResult {
  final String uid;
  final String id;
  final ({
    String descricao,
    DateTime dataHora,
    bool finalizado,
  }) data;
  @override
  final TaskError error;

  ParametrosUpdateTasks({
    required this.uid,
    required this.id,
    required this.data,
    required this.error,
  });
}
