import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'filtro_tasks/domain/model/filtro_tasks_enum.dart';
import 'filtro_tasks/domain/model/task_model.dart';
import 'get_periodo/domain/model/periodo_model.dart';
import 'home_update_task/domain/model/home_update_tasks_model.dart';
import 'update_display_name/domain/model/update_display_name_model.dart';
import 'update_foto/domain/model/update_foto_model.dart';

final class FeaturesHomePresenter {
  static FeaturesHomePresenter? _instance;

  final UDNusecase _updateDisplayName;
  final UFusecase _updateFoto;
  final FTusecase _filtroTasks;
  final GPusecase _getPeriodoUsecase;
  final UHTusecase _homeUpdateTask;

  FeaturesHomePresenter._({
    required UDNusecase updateDisplayName,
    required UFusecase updateFoto,
    required FTusecase filtroTasks,
    required GPusecase getPeriodoUsecase,
    required UHTusecase homeUpdateTask,
  })  : _updateDisplayName = updateDisplayName,
        _filtroTasks = filtroTasks,
        _getPeriodoUsecase = getPeriodoUsecase,
        _homeUpdateTask = homeUpdateTask,
        _updateFoto = updateFoto;

  factory FeaturesHomePresenter({
    required UDNusecase updateDisplayName,
    required UFusecase updateFoto,
    required FTusecase filtroTasks,
    required UHTusecase homeUpdateTask,
    required GPusecase getPeriodoUsecase,
  }) {
    _instance ??= FeaturesHomePresenter._(
      updateDisplayName: updateDisplayName,
      updateFoto: updateFoto,
      filtroTasks: filtroTasks,
      homeUpdateTask: homeUpdateTask,
      getPeriodoUsecase: getPeriodoUsecase,
    );
    return _instance!;
  }

  Future<Unit> updateDisplayName(
    String nome,
  ) async {
    final data = await _updateDisplayName(ParametrosUpdateDisplayName(
      nome: nome,
      error: UserError(message: "Erro ao atualizar o usuário!"),
    ));
    switch (data) {
      case SuccessReturn<UpdateDisplayNameModel>():
        return unit;
      case ErrorReturn<UpdateDisplayNameModel>():
        throw data.result;
    }
  }

  Future<Unit> updateFoto() async {
    final data = await _updateFoto(NoParams(
      error: UserError(message: "Erro ao atualizar o usuário!"),
    ));
    switch (data) {
      case SuccessReturn<UpdateFotoModel>():
        return unit;
      case ErrorReturn<UpdateFotoModel>():
        throw data.result;
    }
  }

  Future<
      ({
        List<TaskModel> listTasks,
        DateTime end,
        DateTime start,
      })> filtroTasks({
    required FiltroTasksEnum filtro,
    required String uid,
  }) async {
    final periodo = await _getPeriodo(filtro);
    final data = await _filtroTasks(
      ParametrosFiltroTasks(
        uid: uid,
        error: FilterError(message: "Erro ao filtrar as tasks!"),
        periodo: periodo,
      ),
    );
    switch (data) {
      case SuccessReturn<List<TaskModel>>():
        return (listTasks: data.result, end: periodo.end, start: periodo.start);
      case ErrorReturn<List<TaskModel>>():
        throw data.result;
    }
  }

  Future<({DateTime start, DateTime end})> _getPeriodo(
      FiltroTasksEnum filtro) async {
    final data = await _getPeriodoUsecase(
      ParametrosGetPeriodo(
        error: FilterError(message: "Erro ao filtrar as tasks!"),
        filtro: filtro,
      ),
    );
    switch (data) {
      case SuccessReturn<PeriodoModel>():
        return (start: data.result.start, end: data.result.end);
      case ErrorReturn<PeriodoModel>():
        throw data.result;
    }
  }

  Future<Unit> homeUpdateTask({
    required int id,
    required String uid,
    required DateTime dataHora,
    required String descricao,
    required bool finalizado,
  }) async {
    final data = await _homeUpdateTask(ParametrosHomeUpdateTasks(
      id: id,
      uid: uid,
      data: (dataHora: dataHora, descricao: descricao, finalizado: finalizado),
      error: TaskUpdateError(message: "Erro ao atualizar Task"),
    ));
    switch (data) {
      case SuccessReturn<HomeUpdateTasksModel>():
        return unit;
      case ErrorReturn<HomeUpdateTasksModel>():
        throw data.result;
    }
  }
}
