import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

final class SignInWithGoogleDatasource
    implements Datasource<GoogleSignInAccount> {
  final GoogleSignIn signIn;

  SignInWithGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<GoogleSignInAccount> call(NoParams parameters) async {
    throw Exception("Erro ao fazer o login com google.");
  }
}
