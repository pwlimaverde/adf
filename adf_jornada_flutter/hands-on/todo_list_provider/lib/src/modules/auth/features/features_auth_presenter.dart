import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../sevices/features/features_service_presenter.dart';
import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'forgot_password/domain/model/forgot_password_model.dart';
import 'login_with_email/domain/model/login_with_email_model.dart';
import 'register_firebase_auth/domain/model/register_firebase_auth_model.dart';
import 'sign_in_with_google/domain/model/login_with_google_model.dart';
import 'sign_out/domain/model/sign_out_model.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  final FeaturesServicePresenter _featuresServicePresenter;
  final RFUsecase _registerFirebaseAuth;
  final LWEUsecase _loginWithEmail;
  final FPUsecase _forgotPassword;
  final LWGUsecase _loginWithGoogle;
  final SIOUsecase _siginOut;

  FeaturesAuthPresenter._({
    required FeaturesServicePresenter featuresServicePresenter,
    required RFUsecase registerFirebaseAuth,
    required LWEUsecase loginWithEmail,
    required FPUsecase forgotPassword,
    required LWGUsecase loginWithGoogle,
    required SIOUsecase siginOut,
  })  : _registerFirebaseAuth = registerFirebaseAuth,
        _featuresServicePresenter = featuresServicePresenter,
        _loginWithGoogle = loginWithGoogle,
        _loginWithEmail = loginWithEmail,
        _siginOut = siginOut,
        _forgotPassword = forgotPassword;

  factory FeaturesAuthPresenter({
    required FeaturesServicePresenter featuresServicePresenter,
    required RFUsecase registerFirebaseAuth,
    required LWEUsecase loginWithEmail,
    required FPUsecase forgotPassword,
    required LWGUsecase loginWithGoogle,
    required SIOUsecase siginOut,
  }) {
    _instance ??= FeaturesAuthPresenter._(
      featuresServicePresenter: featuresServicePresenter,
      registerFirebaseAuth: registerFirebaseAuth,
      loginWithEmail: loginWithEmail,
      forgotPassword: forgotPassword,
      loginWithGoogle: loginWithGoogle,
        siginOut: siginOut,
    );
    return _instance!;
  }

  Future<User?> registerFirebaseAuth(String email, String password) async {
    final data = await _registerFirebaseAuth(ParametrosEmailAndPassword(
      email: email,
      password: password,
      error: AuthError(message: "Erro ao registrar Usuário!"),
    ));
    switch (data) {
      case SuccessReturn<RegisterFirebaseAuthModel>():
        return data.result.user;
      case ErrorReturn<RegisterFirebaseAuthModel>():
        throw data.result;
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    final data = await _loginWithEmail(ParametrosEmailAndPassword(
      email: email,
      password: password,
      error: AuthError(message: "Erro ao fazer login!"),
    ));
    switch (data) {
      case SuccessReturn<LoginWithEmailModel>():
        return data.result.user;
      case ErrorReturn<LoginWithEmailModel>():
        throw data.result;
    }
  }

  Future<Unit> loginWithGoogle() async {
    final data = await _loginWithGoogle(NoParams(
      error: AuthError(message: "Erro ao fazer login!"),
    ));
    switch (data) {
      case SuccessReturn<LoginWithGoogleModel>():
        return unit;
      case ErrorReturn<LoginWithGoogleModel>():
        throw data.result;
    }
  }

    Future<Unit> siginOutService() async {
    final data = await _siginOut(NoParams());
    switch (data) {
      case SuccessReturn<SignOutModel>():
        _featuresServicePresenter.user = null;
        return unit;
      case ErrorReturn<SignOutModel>():
        throw data.result.message;
    }
  }

  Future<Unit> forgotPassword(
    String email,
  ) async {
    final data = await _forgotPassword(ParametrosEmail(
      email: email,
      error: AuthError(message: "Erro resetar o Password!"),
    ));
    switch (data) {
      case SuccessReturn<ForgotPasswordModel>():
        return unit;
      case ErrorReturn<ForgotPasswordModel>():
        throw data.result;
    }
  }
}
