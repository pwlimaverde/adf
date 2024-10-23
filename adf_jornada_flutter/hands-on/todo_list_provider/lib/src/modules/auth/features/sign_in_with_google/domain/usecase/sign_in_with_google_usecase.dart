import 'package:return_success_or_error/return_success_or_error.dart';

import '../model/login_with_google_model.dart';

final class SignInWithGoogleUsecase
    extends UsecaseBaseCallData<LoginWithGoogleModel, LoginWithGoogleModel> {
  SignInWithGoogleUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<LoginWithGoogleModel>> call(
    NoParams parameters,
  ) async {
    return await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );
  }
}
