import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../../sevices/features/features_service_presenter.dart';
import '../../features/features_tasks_presenter.dart';

final class TaskUpdateController extends DefautChangNotifier {
  final FeaturesTaskPresenter _featuresTaskPresenter;
  final FeaturesServicePresenter _featuresServicePresenter;
  DateTime? _selectedDate;

  TaskUpdateController({
    required FeaturesTaskPresenter featuresTaskPresenter,
    required FeaturesServicePresenter featuresServicePresenter,
  })  : _featuresTaskPresenter = featuresTaskPresenter,
        _featuresServicePresenter = featuresServicePresenter;

  set selectedDate(DateTime? value) {
    resetStatus();
    _selectedDate = value;
    notifyListeners();
  }

  set selectedDateAtual(DateTime? value) {
    _selectedDate = value;
  }

  DateTime? get selectedDate => _selectedDate;

  User? get user => _featuresServicePresenter.user;

  void updateTask({
    required int id,
    required String descricao,
    required bool finalizado,
  }) async {
    try {
      showLoading();
      if (_selectedDate != null && user != null) {
        await _featuresTaskPresenter.updateTask(
          uid: user!.uid,
          id: id,
          dataHora: _selectedDate!,
          descricao: descricao,
          finalizado: finalizado
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
