import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../model/login_with_google_model.dart';

final class SignInWithGoogleUsecase
    extends UsecaseBaseCallData<LoginWithGoogleModel, GoogleSignInAccount> {
  SignInWithGoogleUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<LoginWithGoogleModel>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<GoogleSignInAccount>():
        final account = resultDatacource.result;

        return SuccessReturn(
            success: LoginWithGoogleModel(
          account: account,
        ));

      case ErrorReturn<GoogleSignInAccount>():
        return ErrorReturn(error: resultDatacource.result);
    }
  }
}
