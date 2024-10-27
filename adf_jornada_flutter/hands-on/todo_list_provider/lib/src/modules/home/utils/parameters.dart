import 'package:return_success_or_error/return_success_or_error.dart';

import 'erros.dart';

final class ParametrosUpdateDisplayName implements ParametersReturnResult {
  final String nome;
  @override
  final UserError error;

  ParametrosUpdateDisplayName({
    required this.nome,
    required this.error,
  });
}