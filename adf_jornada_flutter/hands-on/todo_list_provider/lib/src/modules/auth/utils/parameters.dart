import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import 'erros.dart';

final class ParametrosEmailAndPassword implements ParametersReturnResult {
  final String email;
  final String password;
  final FirebaseAuth authInstance;
  @override
  final AuthError error;

  ParametrosEmailAndPassword({
    required this.email,
    required this.password,
    required this.authInstance,
    required this.error,
  });
}
