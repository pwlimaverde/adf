import 'package:return_success_or_error/return_success_or_error.dart';

import '../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import 'erros.dart';

final class ParametrosUpdateDisplayName implements ParametersReturnResult {
  final String nome;
  @override
  final UserError error;

  ParametrosUpdateDisplayName({
    required this.nome,
    required this.error,
  });
}

final class ParametrosFiltroTasks implements ParametersReturnResult {
  final String uid;
  final ({DateTime start, DateTime end}) periodo;
  @override
  final FilterError error;

  ParametrosFiltroTasks({
    required this.uid,
    required this.periodo,
    required this.error,
  });
}

final class ParametrosGetPeriodo implements ParametersReturnResult {
  final FiltroTasksEnum filtro;
  @override
  final FilterError error;

  ParametrosGetPeriodo({
    required this.filtro,
    required this.error,
  });
}

final class ParametrosHomeUpdateTasks implements ParametersReturnResult {
  final String uid;
  final int id;
  final ({
    String descricao,
    DateTime dataHora,
    bool finalizado,
  }) data;
  @override
  final TaskUpdateError error;

  ParametrosHomeUpdateTasks({
    required this.uid,
    required this.id,
    required this.data,
    required this.error,
  });
}

final class ParametrosApagarTasks implements ParametersReturnResult {
  final String uid;
  final int id;
  @override
  final TaskUpdateError error;

  ParametrosApagarTasks({
    required this.uid,
    required this.id,
    required this.error,
  });
}
