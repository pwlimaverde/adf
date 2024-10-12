import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'login_with_email/domain/model/login_with_email_model.dart';
import 'login_with_email/domain/usecase/loguin_with_email_usecase.dart';
import 'register_firebase_auth/domain/model/register_firebase_auth_model.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  late FirebaseAuth authInstance;
  late User user;


  final AuthUsecase _authUsecase;
  final RFUsecase _registerFirebaseAuth;
  final LWEUsecase _loguinWithEmail;


  FeaturesAuthPresenter._({
    required AuthUsecase authUsecase,
    required RFUsecase registerFirebaseAuth,
    required LWEUsecase loguinWithEmail,
  })  : _registerFirebaseAuth = registerFirebaseAuth,
        _loguinWithEmail = loguinWithEmail,
        _authUsecase = authUsecase;

  factory FeaturesAuthPresenter({
    required AuthUsecase authUsecase,
    required RFUsecase registerFirebaseAuth,
    required LWEUsecase loguinWithEmail,
  }) {
    _instance ??= FeaturesAuthPresenter._(
      authUsecase: authUsecase,
      registerFirebaseAuth: registerFirebaseAuth,
      loguinWithEmail: loguinWithEmail,
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

  Future<User?> loguinWithEmailUsecase(String email, String password) async {
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
}
