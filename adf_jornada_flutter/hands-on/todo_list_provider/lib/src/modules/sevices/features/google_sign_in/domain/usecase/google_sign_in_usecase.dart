import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

///Usecase with external Datasource call
final class GoogleSignInUsecase extends UsecaseBase<GoogleSignIn> {
  final GoogleSignIn _signIn;

  GoogleSignInUsecase(GoogleSignIn signIn) : _signIn = signIn;

  @override
  Future<ReturnSuccessOrError<GoogleSignIn>> call(NoParams parameters) async {
    return SuccessReturn(
      success: _signIn,
    );
  }
}
