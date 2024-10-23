import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../../sevices/utils/scopes.dart';
import '../../../../utils/erros.dart';
import '../../domain/model/login_with_google_model.dart';

final class SignInWithGoogleDatasource
    implements Datasource<LoginWithGoogleModel> {
  final GoogleSignIn signIn;
  final FirebaseAuth authInstance;

  SignInWithGoogleDatasource({
    required this.signIn,
    required this.authInstance,
  });
  @override
  Future<LoginWithGoogleModel> call(NoParams parameters) async {
    try {
      final account = await signIn.signIn();
      if (account != null) {
        final loginTypes =
            await authInstance.fetchSignInMethodsForEmail(account.email);
        if (loginTypes.contains('password')) {
          throw AuthError(
              message:
                  "Login registrado por Email, digite seu email e senha para efetuar o login!");
        }
        final checkAccessScopes = await signIn.requestScopes(scopes);
        if (checkAccessScopes) {
          final user = await _getUser(account);
          if (user != null) {
            return LoginWithGoogleModel(user: user);
          } else {
            throw AuthError(message: "Erro ao fazer o login com google.");
          }
        } else {
          final requestAccess = await signIn.requestScopes(signIn.scopes);
          if (requestAccess) {
            final user = await _getUser(account);
            if (user != null) {
              return LoginWithGoogleModel(user: user);
            } else {
              throw AuthError(message: "Erro ao fazer o login com google.");
            }
          } else {
            throw AuthError(
                message: "Erro ao fazer o login com google. Acesso Negado.");
          }
        }
      } else {
        throw AuthError(message: "Erro ao fazer o login com google.");
      }
    } on AuthError catch (e) {
      throw AuthError(message: e.message);
    } catch (e) {
      throw AuthError(message: "Erro ao fazer o login com google. $e");
    }
  }

  Future<User?> _getUser(GoogleSignInAccount account) async {
    final GoogleSignInAuthentication googleAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Faça login no Firebase com a credencial.
    UserCredential userCredential =
        await authInstance.signInWithCredential(credential);

    return userCredential.user;
  }
}
