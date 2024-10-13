import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'forgot_password/domain/model/forgot_password_model.dart';
import 'login_with_email/domain/model/login_with_email_model.dart';
import 'register_firebase_auth/domain/model/register_firebase_auth_model.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  late FirebaseAuth authInstance;
  late User user;

  final AuthUsecase _authUsecase;
  final RFUsecase _registerFirebaseAuth;
  final LWEUsecase _loguinWithEmail;
  final FPUsecase _forgotPassword;

  FeaturesAuthPresenter._({
    required AuthUsecase authUsecase,
    required RFUsecase registerFirebaseAuth,
    required LWEUsecase loguinWithEmail,
    required FPUsecase forgotPassword,
  })  : _registerFirebaseAuth = registerFirebaseAuth,
        _loguinWithEmail = loguinWithEmail,
        _forgotPassword = forgotPassword,
        _authUsecase = authUsecase;

  factory FeaturesAuthPresenter({
    required AuthUsecase authUsecase,
    required RFUsecase registerFirebaseAuth,
    required LWEUsecase loguinWithEmail,
    required FPUsecase forgotPassword,
  }) {
    _instance ??= FeaturesAuthPresenter._(
      authUsecase: authUsecase,
      registerFirebaseAuth: registerFirebaseAuth,
      loguinWithEmail: loguinWithEmail,
      forgotPassword: forgotPassword,
    );
    return _instance!;
  }

  Future<Unit> authInit() async {
    final data = await _authUsecase(NoParams());
    switch (data) {
      case SuccessReturn<FirebaseAuth>():
        authInstance = data.result;
        return unit;
      case ErrorReturn<FirebaseAuth>():
        throw data.result.message;
    }
  }

  Future<User?> registerFirebaseAuth(String email, String password) async {
    final data = await _registerFirebaseAuth(ParametrosEmailAndPassword(
      email: email,
      password: password,
      authInstance: authInstance,
      error: AuthError(message: "Erro ao registrar Usuário!"),
    ));
    switch (data) {
      case SuccessReturn<RegisterFirebaseAuthModel>():
        user = data.result.user;
        return data.result.user;
      case ErrorReturn<RegisterFirebaseAuthModel>():
        throw data.result;
    }
  }

  Future<User?> loguinWithEmail(String email, String password) async {
    final data = await _loguinWithEmail(ParametrosEmailAndPassword(
      email: email,
      password: password,
      authInstance: authInstance,
      error: AuthError(message: "Erro ao fazer login!"),
    ));
    switch (data) {
      case SuccessReturn<LoginWithEmailModel>():
        user = data.result.user;
        return data.result.user;
      case ErrorReturn<LoginWithEmailModel>():
        throw data.result;
    }
  }

  Future<Unit> forgotPassword(
    String email,
  ) async {
    final data = await _forgotPassword(ParametrosEmail(
      email: email,
      authInstance: authInstance,
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
