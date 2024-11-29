import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../model/current_user_model.dart';

final class CurrentUserGoogleUsecase extends UsecaseBase<CurrentUserModel> {
  final FirebaseAuth _firebaseAuth;

  CurrentUserGoogleUsecase(FirebaseAuth firebaseAuth):_firebaseAuth = firebaseAuth;

  @override
  Future<ReturnSuccessOrError<CurrentUserModel>> call(NoParams parameters) async {
    try {
      
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Usuário não encontrado!",
          ),
        );
      }
      return SuccessReturn(success: CurrentUserModel(user: user));
    } catch (e) {
      return ErrorReturn(
        error: ErrorGeneric(
          message: e.toString(),
        ),
      );
    }
  }
}
