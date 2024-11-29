import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import '../model/forgot_password_model.dart';

final class ForgotPasswordUsecase extends UsecaseBase<ForgotPasswordModel> {
  FirebaseAuth _authInstance;
  ForgotPasswordUsecase(
    FirebaseAuth authInstance,
  ):_authInstance = authInstance;
  @override
  Future<ReturnSuccessOrError<ForgotPasswordModel>> call(
      ParametrosEmail parameters) async {
    try {
      final loginTypes = await _authInstance
          .fetchSignInMethodsForEmail(parameters.email);
      if (loginTypes.contains('password')) {
        await _authInstance
            .sendPasswordResetEmail(email: parameters.email);
        return SuccessReturn(
          success: ForgotPasswordModel(),
        );
      } else if (loginTypes.contains('google')) {
        return ErrorReturn(
          error: AuthError(message: "Efetue o login pelo Google!"),
        );
      } else {
        return ErrorReturn(
          error: AuthError(message: "E-mail não registrado!"),
        );
      }
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return ErrorReturn(
        error: AuthError(
          message: e.message ?? parameters.error.message,
        ),
      );
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'invalid-email') {
        return ErrorReturn(
          error: AuthError(
            message: "Email inválido!",
          ),
        );
      }
      return ErrorReturn(
        error: AuthError(
          message: e.message ?? parameters.error.message,
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);
      return ErrorReturn(
        error: AuthError(
          message: "Erro ao recuperar a senha!",
        ),
      );
    }
  }
}
