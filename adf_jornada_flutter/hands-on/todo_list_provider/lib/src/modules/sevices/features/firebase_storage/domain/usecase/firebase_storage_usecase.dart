import 'package:firebase_storage/firebase_storage.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

///Usecase with external Datasource call
final class FirebaseStorageUsecase extends UsecaseBase<FirebaseStorage> {
  final FirebaseStorage _firebaseStorage;

  FirebaseStorageUsecase(
    FirebaseStorage firebaseStorage,
  ) : _firebaseStorage = firebaseStorage;

  @override
  Future<ReturnSuccessOrError<FirebaseStorage>> call(NoParams parameters) async {
    return SuccessReturn(
      success: _firebaseStorage,
    );
  }
}
