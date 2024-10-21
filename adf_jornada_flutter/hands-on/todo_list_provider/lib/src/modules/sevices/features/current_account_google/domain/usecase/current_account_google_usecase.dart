import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/typedefs.dart';

final class CurrentAccountGoogleUsecase extends UsecaseBase<StCAGoogleData> {
  final GoogleSignIn _signIn;

  CurrentAccountGoogleUsecase(GoogleSignIn signIn) : _signIn = signIn;

  @override
  Future<ReturnSuccessOrError<StCAGoogleData>> call(NoParams parameters) async {
    try {
      _signIn.signInSilently();
      return SuccessReturn(success: _signIn.onCurrentUserChanged);
    } catch (e) {
      return ErrorReturn(
        error: ErrorGeneric(
          message: e.toString(),
        ),
      );
    }
  }
}
