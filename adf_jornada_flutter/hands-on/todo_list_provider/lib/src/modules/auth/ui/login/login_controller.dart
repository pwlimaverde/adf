import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../features/features_auth_presenter.dart';
import '../../utils/erros.dart';

final class LoginController extends DefautChangNotifier {
  final FeaturesAuthPresenter _featuresAuthPresenter;

  LoginController({
    required FeaturesAuthPresenter featuresAuthPresenter,
  })  : _featuresAuthPresenter = featuresAuthPresenter;

  Future<void> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      showLoading();
      final user = await _featuresAuthPresenter.loginWithEmail(
        email,
        password,
      );
      if (user != null) {
        setSuccess("Login realizado com sucesso!");
      } else {
        setError("Erro ao fazer login!");
      }
    } on AuthError catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      showLoading();
      await _featuresAuthPresenter.loginWithGoogle();

      setSuccess("Login realizado com sucesso!");
    } on AuthError catch (e) {
      logout();
      setError(e.message);
    } finally {
      hideLoading();
    }
  }

  void forgotPassword(String email) async {
    try {
      showLoading();
      await _featuresAuthPresenter.forgotPassword(
        email,
      );
      setInfo("Email de recuperação enviado com sucesso!");
    } on AuthError catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
    }
  }

  void logout() async {
    try {
      await _featuresAuthPresenter.siginOutService();
    } on AuthError catch (e) {
      setError(e.message);
    }
  }
}
