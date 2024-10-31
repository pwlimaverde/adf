import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../../sevices/features/local_storage/domain/interface/local_storage.dart';

final class TaskCreateController extends DefautChangNotifier {
  final LocalStorage _localStorage;
  DateTime? _selectedDate;

  TaskCreateController({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

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
        await _localStorage.write(id: '', data: (
          dataHora: _selectedDate!,
          descricao: description,
          finalizado: false
        ));
        setSuccess('Task criada com sucesso!');
      }else{
        setError('Data da Atividade não selecionada!');
      }
    } catch (e, s) {
      print(e);
      print(s);
      setError('Erro ao cadastrar Atividade!');
    }finally{
      hideLoading();
    }
  }
}
