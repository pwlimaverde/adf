import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'create_task/domain/model/create_tasks_model.dart';
import 'update_task/domain/model/create_tasks_model.dart';

final class FeaturesTaskPresenter {
  static FeaturesTaskPresenter? _instance;

  final CTusecase _createTask;
  final UTusecase _updateTask;

  FeaturesTaskPresenter._({
    required CTusecase createTask,
    required UTusecase updateTask,
  })  : _createTask = createTask,
        _updateTask = updateTask;

  factory FeaturesTaskPresenter({
    required CTusecase createTask,
    required UTusecase updateTask,
  }) {
    _instance ??= FeaturesTaskPresenter._(
      updateTask: updateTask,
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

  Future<Unit> updateTask({
    required int id,
    required String uid,
    required DateTime dataHora,
    required String descricao,
    required bool finalizado,
  }) async {
    final data = await _updateTask(ParametrosUpdateTasks(
      id: id,
      uid: uid,
      data: (
        dataHora: dataHora,
        descricao: descricao,
        finalizado: finalizado
      ),
      error: TaskError(message: "Erro ao atualizar Task"),
    ));
    switch (data) {
      case SuccessReturn<UpdateTasksModel>():
        return unit;
      case ErrorReturn<UpdateTasksModel>():
        throw data.result;
    }
  }
}
