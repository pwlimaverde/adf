

import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../sevices/features/local_storage/domain/interface/local_storage.dart';
import '../../../../utils/parameters.dart';
import '../model/apagar_tasks_model.dart';

final class ApagarTaskUsecase extends UsecaseBase<ApagarTasksModel> {
  final LocalStorage _localStorage;
  ApagarTaskUsecase(
    LocalStorage localStorage,
  ) : _localStorage = localStorage;
  @override
  Future<ReturnSuccessOrError<ApagarTasksModel>> call(
      ParametrosApagarTasks parameters) async {
    try {
      await _localStorage.remove(
        id: parameters.id,
        uid: parameters.uid,
      );
      return SuccessReturn(success: ApagarTasksModel());
    } catch (e) {
      return ErrorReturn(
        error: parameters.error,
      );
    }
  }
}
