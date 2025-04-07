import 'package:dependencies/dependencies.dart';

///Usecase with external Datasource call
final class FirebaseAuthUsecase extends UsecaseBase<FirebaseAuth> {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthUsecase(
    FirebaseAuth firebaseAuth,
  ) : _firebaseAuth = firebaseAuth;

  @override
  Future<ReturnSuccessOrError<FirebaseAuth>> call(NoParams parameters) async {
    return SuccessReturn(
      success: _firebaseAuth,
    );
  }
}
