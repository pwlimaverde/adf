import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import '../../../filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../model/periodo_model.dart';

final class GetPeriodoUsecase extends UsecaseBase<PeriodoModel> {
  @override
  Future<ReturnSuccessOrError<PeriodoModel>> call(
      ParametrosGetPeriodo parameters) async {
    try {
      switch (parameters.filtro) {
        case FiltroTasksEnum.hoje:
          return SuccessReturn(
            success: PeriodoModel(
              start: DateTime.now(),
              end: DateTime.now(),
            ),
          );
        case FiltroTasksEnum.amanha:
          return SuccessReturn(
            success: PeriodoModel(
              start: DateTime.now().add(Duration(days: 1)),
              end: DateTime.now().add(Duration(days: 1)),
            ),
          );
        case FiltroTasksEnum.semana:
          final hoje = DateTime.now();
          var start = DateTime(hoje.year, hoje.month, hoje.day, 0, 0, 0);
          if (start.weekday != DateTime.monday) {
            start = start.subtract(Duration(days: (start.weekday - 1)));
          }
          final end = start.add(Duration(days: 7));
          return SuccessReturn(
            success: PeriodoModel(
              start: start,
              end: end,
            ),
          );
        case FiltroTasksEnum.mes:
          final hoje = DateTime.now();
          var start = DateTime(hoje.year, hoje.month, 1, 0, 0, 0);
          var end = DateTime(hoje.year, hoje.month + 1, 1, 0, 0, 0)
              .subtract(Duration(days: 1));

          return SuccessReturn(
            success: PeriodoModel(
              start: start,
              end: end,
            ),
          );
        case FiltroTasksEnum.todas:
          final hoje = DateTime.now();
          var start = DateTime(2020, 1, 1, 0, 0, 0);
          var end = DateTime(hoje.year, hoje.month + 1, 1, 0, 0, 0)
              .add(Duration(days: 10 * 365));

          return SuccessReturn(
            success: PeriodoModel(
              start: start,
              end: end,
            ),
          );
      }
    } catch (e) {
      return ErrorReturn(
        error: FilterError(
          message: "Erro ao carregarr o periodo! - $e",
        ),
      );
    }
  }
}
