import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../../sevices/features/features_service_presenter.dart';
import '../../features/features_tasks_presenter.dart';

final class TaskCreateController extends DefautChangNotifier {
  final FeaturesTaskPresenter _featuresTaskPresenter;
  final FeaturesServicePresenter _featuresServicePresenter;
  DateTime? _selectedDate;

  TaskCreateController({
    required FeaturesTaskPresenter featuresTaskPresenter,
    required FeaturesServicePresenter featuresServicePresenter,
  })  : _featuresTaskPresenter = featuresTaskPresenter,
        _featuresServicePresenter = featuresServicePresenter;

  set selectedDate(DateTime? value) {
    resetStatus();
    _selectedDate = value;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  User? get user => _featuresServicePresenter.user;

  void createTask({
    required String description,
  }) async {
    try {
      showLoading();
      if (_selectedDate != null && user != null) {
        await _featuresTaskPresenter.createTask(
          uid: user!.uid,
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
