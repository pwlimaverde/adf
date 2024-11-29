import '../../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../../sevices/features/features_service_presenter.dart';
import '../../features/features_auth_presenter.dart';
import '../../utils/erros.dart';

final class LoginController extends DefautChangNotifier {
  final FeaturesAuthPresenter _featuresAuthPresenter;
  final FeaturesServicePresenter _featuresServicePresenter;


  LoginController({
    required FeaturesAuthPresenter featuresAuthPresenter,
    required FeaturesServicePresenter featuresServicePresenter,
  })  : _featuresAuthPresenter = featuresAuthPresenter, 
        _featuresServicePresenter = featuresServicePresenter;

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
        await _featuresServicePresenter.currentUserService();
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
      await _featuresServicePresenter.currentUserService();
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
      await _featuresServicePresenter.signOutService();
    } on AuthError catch (e) {
      setError(e.message);
    }
  }
}
