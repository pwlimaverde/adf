import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../features/features_tasks_presenter.dart';

final class TaskCreateController extends DefautChangNotifier {
  final FeaturesTaskPresenter _featuresTaskPresenter;
  DateTime? _selectedDate;

  TaskCreateController({
    required FeaturesTaskPresenter featuresTaskPresenter,
  }) : _featuresTaskPresenter = featuresTaskPresenter;

  set selectedDate(DateTime? value) {
    resetStatus();
    _selectedDate = value;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  void createTask({
    required String description,
  }) async {
    try {
      showLoading();
      if (_selectedDate != null) {
        await _featuresTaskPresenter.createTask(
          dataHora: _selectedDate!,
          descricao: description,
        );
        setSuccess('Task criada com sucesso!');
      } else {
        setError('Data da Task não selecionada!');
      }
    } catch (e) {
      setError('Erro ao cadastrar Task! - $e');
    } finally {
      hideLoading();
    }
  }
}
