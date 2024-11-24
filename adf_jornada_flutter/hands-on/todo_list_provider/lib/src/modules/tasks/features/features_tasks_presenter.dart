import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'create_task/domain/model/create_tasks_model.dart';

final class FeaturesTaskPresenter {
  static FeaturesTaskPresenter? _instance;

  final CTusecase _createTask;

  FeaturesTaskPresenter._({
    required CTusecase createTask,
  }) : _createTask = createTask;

  factory FeaturesTaskPresenter({
    required CTusecase createTask,
  }) {
    _instance ??= FeaturesTaskPresenter._(
      createTask: createTask,
    );
    return _instance!;
  }

  Future<Unit> createTask({
    required String descricao,
    required DateTime dataHora,
    required String uid,
  }) async {
    final data = await _createTask(ParametrosCreateTasks(
      uid: uid,
      error: TaskError(message: "Erro ao atualizar criar Task"),
      descricao: descricao,
      dataHora: dataHora,
    ));
    switch (data) {
      case SuccessReturn<CreateTasksModel>():
        return unit;
      case ErrorReturn<CreateTasksModel>():
        throw data.result;
    }
  }
}
