import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../sevices/features/local_storage/domain/interface/local_storage.dart';
import '../../../utils/parameters.dart';
import '../domain/model/tasks_maps_model.dart';

final class FiltroTasksDatasource implements Datasource<TasksMapsModel> {
  final LocalStorage _localStorage;

  FiltroTasksDatasource(
    LocalStorage localStorage,
  ) : _localStorage = localStorage;
  @override
  Future<TasksMapsModel> call(ParametrosFiltroTasks parameters) async {
    final result = await _localStorage.read(periodo: parameters.periodo);

    return TasksMapsModel(result);
  }
}

// ({DateTime start, DateTime end}) _getPeriodo(FiltroTasksEnum filtro) {
//   switch (filtro) {
//     case FiltroTasksEnum.hoje:
//       return (start: DateTime.now(), end: DateTime.now());
//     case FiltroTasksEnum.amanha:
//       return (
//         start: DateTime.now().add(Duration(days: 1)),
//         end: DateTime.now().add(Duration(days: 1))
//       );
//     case FiltroTasksEnum.semana:
//       final hoje = DateTime.now();
//       var start = DateTime(hoje.year, hoje.month, hoje.day, 0, 0, 0);
//       if (start.weekday != DateTime.monday) {
//         start = start.subtract(Duration(days: (start.weekday - 1)));
//       }
//       final end = start.add(Duration(days: 7));
//       return (start: start, end: end);
//     case FiltroTasksEnum.mes:
//       final hoje = DateTime.now();
//       var start = DateTime(hoje.year, hoje.month, 1, 0, 0, 0);
//       var end = DateTime(hoje.year, hoje.month + 1, 1, 0, 0, 0)
//           .subtract(Duration(days: 1));

//       return (start: start, end: end);
//   }
// }
