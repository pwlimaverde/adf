import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import '../model/task_model.dart';
import '../model/tasks_maps_model.dart';

final class FiltroTasksUsecase
    extends UsecaseBaseCallData<List<TaskModel>, TasksMapsModel> {
  FiltroTasksUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<List<TaskModel>>> call(
      ParametrosFiltroTasks parameters) async {
    try {
      final data = await resultDatasource(
        parameters: parameters,
        datasource: datasource,
      );
      switch (data) {
        case SuccessReturn<TasksMapsModel>():
          final tasksList = data.result.listTasksMaps
              .map((task) => TaskModel.fromMapSqlite(task))
              .toList();
          return SuccessReturn(success: tasksList);
        case ErrorReturn<TasksMapsModel>():
          return ErrorReturn(
            error: FilterError(
              message: "Erro ao filtar as tasks!",
            ),
          );
      }
    } catch (e) {
      return ErrorReturn(
        error: FilterError(
          message: "Erro ao filtar as tasks! - $e",
        ),
      );
    }
  }
}
