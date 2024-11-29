import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../model/sign_out_model.dart';

final class SignOutUsecase extends UsecaseBase<SignOutModel> {
  final GoogleSignIn _signIn;
  final FirebaseAuth _auth;

  SignOutUsecase({required GoogleSignIn signIn, required FirebaseAuth auth})
      : _signIn = signIn,
        _auth = auth;

  @override
  Future<ReturnSuccessOrError<SignOutModel>> call(NoParams parameters) async {
    try {
      await _signIn.signOut();
      await _auth.signOut();
      return SuccessReturn(success: SignOutModel());
    } catch (e) {
      return ErrorReturn(error: ErrorGeneric(message: e.toString()));
    }
  }
}
