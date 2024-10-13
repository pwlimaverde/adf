import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../features/features_auth_presenter.dart';
import '../../utils/erros.dart';

final class RegisterController extends DefautChangNotifier {
  final FeaturesAuthPresenter _featuresAuthPresenter;

  RegisterController(FeaturesAuthPresenter featuresAuthPresenter)
      : _featuresAuthPresenter = featuresAuthPresenter;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoading();
      final user = await _featuresAuthPresenter.registerFirebaseAuth(
        email,
        password,
      );
      if (user != null) {
        setSuccess("Usuário registrado com sucesso!");
      } else {
        setError("Erro ao registrar usuário!");
      }
    } on AuthError catch (e) {
      setError(e.message);
    } catch (e) {
      setError("Erro desconhecido! - $e");
    } finally {
      hideLoading();
    }
  }
}
