import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  late FirebaseAuth auth;
  late User user;


  final AuthUsecase _authUsecase;
  final RFUsecase _registerFirebaseAuth;

  FeaturesAuthPresenter._({
    required AuthUsecase authService,
    required RFUsecase registerFirebaseAuth,
  })  : _registerFirebaseAuth = registerFirebaseAuth,
        _authUsecase = authService;

  factory FeaturesAuthPresenter({
    required AuthUsecase authService,
    required RFUsecase registerFirebaseAuth,
  }) {
    _instance ??= FeaturesAuthPresenter._(
      authService: authService,
      registerFirebaseAuth: registerFirebaseAuth,
    );
    return _instance!;
  }

  Future<Unit> authService() async {
    final data = await _authUsecase(NoParams());
    switch (data) {
      case SuccessReturn<FirebaseAuth>():
        auth = data.result;
        return unit;
      case ErrorReturn<FirebaseAuth>():
        throw data.result.message;
    }
  }

  Future<User?> registerFirebaseAuth(String email, String password) async {
    final data = await _registerFirebaseAuth(ParametrosRegisterEmail(
      email: email,
      password: password,
      error: AuthError(message: "Erro ao registrar Usuário!"),
    ));
    switch (data) {
      case SuccessReturn<User>():
        user = data.result;
        return data.result;
      case ErrorReturn<User>():
        throw data.result.message;
    }
  }
}
