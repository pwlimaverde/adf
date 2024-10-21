import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../sevices/utils/scopes.dart';

final class SignInWithGoogleDatasource
    implements Datasource<GoogleSignInAccount> {
  final GoogleSignIn signIn;
  final FirebaseAuth authInstance;

  SignInWithGoogleDatasource({
    required this.signIn,
    required this.authInstance,
  });
  @override
  Future<GoogleSignInAccount> call(NoParams parameters) async {
    try {
      final account = await signIn.signIn();
      if (account != null) {
        final loginTypes = await authInstance
          .fetchSignInMethodsForEmail(account.email);
      if (loginTypes.contains('password')) {
        throw Exception(
                "Login registrado por Email, digite seu email e senha para efetuar o login!");
      }
        final checkAccessScopes = await signIn.canAccessScopes(scopes);
        if (checkAccessScopes) {
          return account;
        } else {
          final requestAccess = await signIn.requestScopes(signIn.scopes);
          if (requestAccess) {
            return account;
          } else {
            throw Exception(
                "Erro ao fazer o login com google. Acesso Negado.");
          }
        }
      } else {
        throw Exception("Erro ao fazer o login com google.");
      }
    } catch (e) {
      throw Exception("Erro ao fazer o login com google.");
    }
  }
}
