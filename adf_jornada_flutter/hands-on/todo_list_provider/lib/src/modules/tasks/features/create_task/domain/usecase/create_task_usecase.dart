import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../sevices/features/local_storage/domain/interface/local_storage.dart';
import '../../../../utils/parameters.dart';
import '../model/create_tasks_model.dart';

final class CreateTaskUsecase extends UsecaseBase<CreateTasksModel> {
  final LocalStorage? _localStorage;
  CreateTaskUsecase(
    LocalStorage localStorage,
  ) : _localStorage = localStorage;
  @override
  Future<ReturnSuccessOrError<CreateTasksModel>> call(
      ParametrosCreateTasks parameters) async {
    try {
      if (_localStorage == null) {
        return ErrorReturn(
          error: parameters.error,
        );
      }
      await _localStorage.write(id: '', uid: parameters.uid ,data: (
        dataHora: parameters.dataHora,
        descricao: parameters.descricao,
        finalizado: false
      ),);
      return SuccessReturn(success: CreateTasksModel());
    } catch (e) {
      return ErrorReturn(
        error: parameters.error,
      );
    }
  }
}
