import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import '../model/login_with_email_model.dart';

final class LoginWithEmailUsecase extends UsecaseBase<LoginWithEmailModel> {
  FirebaseAuth authInstance;
  LoginWithEmailUsecase(this.authInstance);

  @override
  Future<ReturnSuccessOrError<LoginWithEmailModel>> call(
    ParametrosEmailAndPassword parameters,
  ) async {
    try {
      final userCredential =
          await authInstance.signInWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );
      final user = userCredential.user;
      if (user != null) {
        return SuccessReturn(
          success: LoginWithEmailModel(user: user),
        );
      } else {
        return ErrorReturn(
          error: parameters.error,
        );
      }
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw ErrorReturn(
        error: AuthError(
          message: "Erro ao realizar o login",
        ),
      );
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'user-not-found') {
        return ErrorReturn(
          error: AuthError(
            message: "Usuario não encontrado!",
          ),
        );
      } else if (e.code == 'wrong-password') {
        return ErrorReturn(
          error: AuthError(
            message: "Senha incorreta!",
          ),
        );
      }else{
        return ErrorReturn(
          error: AuthError(
            message: "Erro ao efetuar o login!",
          ),
        );
      }
    }
  }
}
