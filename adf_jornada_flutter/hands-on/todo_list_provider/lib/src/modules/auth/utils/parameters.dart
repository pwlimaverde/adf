import 'package:return_success_or_error/return_success_or_error.dart';

import 'erros.dart';

final class ParametrosEmailAndPassword implements ParametersReturnResult {
  final String email;
  final String password;
  @override
  final AuthError error;

  ParametrosEmailAndPassword({
    required this.email,
    required this.password,
    required this.error,
  });
}

final class ParametrosEmail implements ParametersReturnResult {
  final String email;
  @override
  final AuthError error;

  ParametrosEmail({
    required this.email,
    required this.error,
  });
}
