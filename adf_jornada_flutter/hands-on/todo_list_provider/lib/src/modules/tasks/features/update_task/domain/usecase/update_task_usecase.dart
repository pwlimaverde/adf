import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../sevices/features/local_storage/domain/interface/local_storage.dart';
import '../../../../utils/parameters.dart';
import '../model/create_tasks_model.dart';

final class CheckTaskUsecase extends UsecaseBase<UpdateTasksModel> {
  final LocalStorage _localStorage;
  CheckTaskUsecase(
    LocalStorage localStorage,
  ) : _localStorage = localStorage;
  @override
  Future<ReturnSuccessOrError<UpdateTasksModel>> call(
      ParametrosUpdateTasks parameters) async {
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
      return SuccessReturn(success: UpdateTasksModel());
    } catch (e) {
      return ErrorReturn(
        error: parameters.error,
      );
    }
  }
}
