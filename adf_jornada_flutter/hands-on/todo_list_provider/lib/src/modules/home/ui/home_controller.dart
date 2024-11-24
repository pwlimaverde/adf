import 'package:firebase_auth/firebase_auth.dart';
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
  DateTime? dataInicial;
  DateTime? dataFinal;
  DateTime? dataSelecionada;

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
      if (user != null) {
        final data = await _featuresHomePresenter.filtroTasks(
            filtro: FiltroTasksEnum.hoje, uid: user!.uid);
        hojeTotalTasks = _setTotalTasksModel(listTasks: data.listTasks);
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadAmanhaTasks() async {
    try {
      if (user != null) {
        final data = await _featuresHomePresenter.filtroTasks(
            filtro: FiltroTasksEnum.amanha, uid: user!.uid);
        amanhaTotalTasks = _setTotalTasksModel(listTasks: data.listTasks);
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadSemanaTasks() async {
    try {
      if (user != null) {
        final data = await _featuresHomePresenter.filtroTasks(
            filtro: FiltroTasksEnum.semana, uid: user!.uid);
        semanaTotalTasks = _setTotalTasksModel(listTasks: data.listTasks);
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadMesTasks() async {
    try {
      if (user != null) {
        final data = await _featuresHomePresenter.filtroTasks(
            filtro: FiltroTasksEnum.mes, uid: user!.uid);
        mesTotalTasks = _setTotalTasksModel(listTasks: data.listTasks);
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _loadTodasTasks() async {
    try {
      if (user != null) {
        final data = await _featuresHomePresenter.filtroTasks(
            filtro: FiltroTasksEnum.todas, uid: user!.uid);
        todasTotalTasks = _setTotalTasksModel(listTasks: data.listTasks);
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  TotalTasksModel _setTotalTasksModel({required List<TaskModel> listTasks}) {
    return TotalTasksModel(
      totalTasks: listTasks.length,
      totalTasksFinish: listTasks.where((task) => task.finalizado).length,
    );
  }

  Future<void> alterarFiltroAtual(
    FiltroTasksEnum filtroAtual, [
    bool? force,
  ]) async {
    try {
      if (filtroAtual != filtroSelecionado || force == true && user != null) {
        showLoading();
        await Future.delayed(const Duration(milliseconds: 15));
        filtroSelecionado = filtroAtual;
        final result = await _featuresHomePresenter.filtroTasks(
            filtro: filtroAtual, uid: user!.uid);
        dataInicial = result.start;
        dataFinal = result.end;
        tasksAtualFilter = result.listTasks;
        tasksAtual = result.listTasks;
        if (filtroAtual == FiltroTasksEnum.semana ||
            filtroAtual == FiltroTasksEnum.mes) {
          if (dataSelecionada != null) {
            filtroPorData(dataSelecionada!);
          } else {
            filtroPorData(result.start);
          }
        } else {
          dataSelecionada = null;
        }
      }
    } catch (e) {
      setError(e.toString());
    } finally {
      hideLoading();
    }
  }

  void filtroPorData(DateTime data) {
    dataSelecionada = data;
    tasksAtualFilter =
        tasksAtual.where((task) => task.dataHora == data).toList();
    notifyListeners();
  }

  Future<void> refreshPage() async {
    try {
      await loadTotalTasks();
      await alterarFiltroAtual(filtroSelecionado, true);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      showLoading();

      cleanStatus();
      await Future.delayed(const Duration(seconds: 3));
      await _featuresServicePresenter.signOutService();
    } catch (e) {
      setError(e.toString());
    } finally {
      hideLoading();
    }
  }

  void cleanStatus() {
    tasksAtual = [];
    tasksAtualFilter = [];
    dataInicial = null;
    dataFinal = null;
    dataSelecionada = null;
    hojeTotalTasks = null;
    amanhaTotalTasks = null;
    semanaTotalTasks = null;
    mesTotalTasks = null;
    todasTotalTasks = null;
    filtroSelecionado = FiltroTasksEnum.hoje;
  }
}
