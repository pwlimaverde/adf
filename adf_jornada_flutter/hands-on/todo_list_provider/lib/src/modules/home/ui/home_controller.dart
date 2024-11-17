import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../sevices/features/features_service_presenter.dart';
import '../features/features_home_presenter.dart';
import '../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../features/filtro_tasks/domain/model/task_model.dart';
import '../features/filtro_tasks/domain/model/total_tasks_model.dart';
import '../utils/erros.dart';

final class HomeController extends DefautChangNotifier {
  final FeaturesHomePresenter _featuresHomePresenter;
  final FeaturesServicePresenter _featuresServicePresenter;

  var filtroSelecionado = FiltroTasksEnum.hoje;
  List<TaskModel> tasksAtual = [];
  List<TaskModel> tasksAtualFilter = [];

  TotalTasksModel? hojeTotalTasks;
  TotalTasksModel? amanhaTotalTasks;
  TotalTasksModel? semanaTotalTasks;
  TotalTasksModel? mesTotalTasks;
  TotalTasksModel? todasTotalTasks;

  HomeController({
    required FeaturesHomePresenter featuresHomePresenter,
    required FeaturesServicePresenter featuresServicePresenter,
  })  : _featuresHomePresenter = featuresHomePresenter,
        _featuresServicePresenter = featuresServicePresenter;

  User? get user => _featuresServicePresenter.user;

  Future<void> updateDisplayName(
    String nome,
  ) async {
    try {
      showLoading();
      await _featuresHomePresenter.updateDisplayName(nome);
      await _featuresServicePresenter.currentUserService();
    } on UserError catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
    }
  }

  Future<void> updateFoto() async {
    try {
      showLoading();
      await _featuresHomePresenter.updateFoto();
      await _featuresServicePresenter.currentUserService();
    } on UserError catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
    }
  }

  Future<void> loadTotalTasks() async {
    try {
      await Future.wait([
        _loadHojeTasks(),
        _loadAmanhaTasks(),
        _loadSemanaTasks(),
        _loadMesTasks(),
        _loadTodasTasks(),
      ]);

      notifyListeners();
    } on FilterError catch (e) {
      setError(e.message);
    }
  }

  Future<void> _loadHojeTasks() async {
    try {
      final data =
          await _featuresHomePresenter.filtroTasks(FiltroTasksEnum.hoje);
      hojeTotalTasks = TotalTasksModel(
        totalTasks: data.length,
        totalTasksFinish: data.where((task) => task.finalizado).length,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadAmanhaTasks() async {
    try {
      final data =
          await _featuresHomePresenter.filtroTasks(FiltroTasksEnum.amanha);
      amanhaTotalTasks = TotalTasksModel(
        totalTasks: data.length,
        totalTasksFinish: data.where((task) => task.finalizado).length,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadSemanaTasks() async {
    try {
      final data =
          await _featuresHomePresenter.filtroTasks(FiltroTasksEnum.semana);
      semanaTotalTasks = TotalTasksModel(
        totalTasks: data.length,
        totalTasksFinish: data.where((task) => task.finalizado).length,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadMesTasks() async {
    try {
      final data =
          await _featuresHomePresenter.filtroTasks(FiltroTasksEnum.mes);
      mesTotalTasks = TotalTasksModel(
        totalTasks: data.length,
        totalTasksFinish: data.where((task) => task.finalizado).length,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadTodasTasks() async {
    try {
      final data =
          await _featuresHomePresenter.filtroTasks(FiltroTasksEnum.todas);
      todasTotalTasks = TotalTasksModel(
        totalTasks: data.length,
        totalTasksFinish: data.where((task) => task.finalizado).length,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> alterarFiltroAtual(FiltroTasksEnum filtroAtual) async {
    try {
      showLoading();
      filtroSelecionado = filtroAtual;
      List<TaskModel> tasks =
          await _featuresHomePresenter.filtroTasks(filtroAtual);
      tasksAtualFilter = tasks;
      tasksAtual = tasks;
    } catch (e) {
      setError(e.toString());
    } finally {
      hideLoading();
    }
  }

  Future<void> refreshPage() async {
    try {
      showLoading();
      await loadTotalTasks();
      await alterarFiltroAtual(filtroSelecionado);
    } catch (e) {
      setError(e.toString());
    } finally {
      hideLoading();
    }
  }
}
