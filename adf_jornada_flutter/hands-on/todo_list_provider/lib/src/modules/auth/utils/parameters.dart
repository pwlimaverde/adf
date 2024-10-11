import 'package:return_success_or_error/return_success_or_error.dart';

import 'erros.dart';

final class ParametrosRegisterEmail implements ParametersReturnResult {
  final String email;
  final String password;
  @override
  final AuthError error;

  ParametrosRegisterEmail({
    required this.email,
    required this.password,
    required this.error,
  });
}
