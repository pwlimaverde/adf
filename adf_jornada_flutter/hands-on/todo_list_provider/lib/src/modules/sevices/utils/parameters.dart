
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

final class ParametrosFirebaseStorage implements ParametersReturnResult {
  final FirebaseFirestore instanceFirebase;
  @override
  final AppError error;

  ParametrosFirebaseStorage({
    required this.instanceFirebase,
    required this.error,
  });
}

final class ParametrosFirebaseInit implements ParametersReturnResult {
  final FirebaseOptions options;
  @override
  final AppError error;

  ParametrosFirebaseInit({
    required this.options,
    required this.error,
  });
}
