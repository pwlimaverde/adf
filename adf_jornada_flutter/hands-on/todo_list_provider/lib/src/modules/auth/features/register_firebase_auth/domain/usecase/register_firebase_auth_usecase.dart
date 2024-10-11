import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';

final class RegisterFirebaseAuthUsecase extends UsecaseBase<User> {
  final FirebaseAuth _firebaseAuth;

  RegisterFirebaseAuthUsecase(
    FirebaseAuth firebaseAuth,
  ) : _firebaseAuth = firebaseAuth;

  @override
  Future<ReturnSuccessOrError<User>> call(
      ParametrosRegisterEmail parameters) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );
      final user = userCredential.user;
      if (user != null) {
        return SuccessReturn(
          success: user,
        );
      } else {
        return ErrorReturn(
          error: parameters.error,
        );
      }
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(parameters.email);
        if (loginTypes.contains('password')) {
          return ErrorReturn(
            error: AuthError(
                message:
                    "E-mail já cadastrado, por favor escolha outro e-mail!"),
          );
        } else {
          return ErrorReturn(
            error: AuthError(
                message:
                    "Você se cadastrou no TodoList pelo Google, por favor utilize ele para  entrar!"),
          );
        }
      } else {
        return ErrorReturn(
          error: AuthError(
            message: e.message ?? parameters.error.message,
          ),
        );
      }
    }
  }
}
