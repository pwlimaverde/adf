

import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../sevices/features/local_storage/domain/interface/local_storage.dart';
import '../../../../utils/parameters.dart';
import '../model/home_update_tasks_model.dart';

final class HomeUpdateTaskUsecase extends UsecaseBase<HomeUpdateTasksModel> {
  final LocalStorage _localStorage;
  HomeUpdateTaskUsecase(
    LocalStorage localStorage,
  ) : _localStorage = localStorage;
  @override
  Future<ReturnSuccessOrError<HomeUpdateTasksModel>> call(
      ParametrosHomeUpdateTasks parameters) async {
    try {
      await _localStorage.write(
        id: parameters.id,
        uid: parameters.uid,
        data: (
          dataHora: parameters.data.dataHora,
          descricao: parameters.data.descricao,
          finalizado: parameters.data.finalizado,
        ),
      );
      return SuccessReturn(success: HomeUpdateTasksModel());
    } catch (e) {
      return ErrorReturn(
        error: parameters.error,
      );
    }
  }
}
