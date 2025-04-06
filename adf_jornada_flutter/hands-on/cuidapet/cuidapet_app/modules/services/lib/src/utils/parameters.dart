import 'package:dependencies/dependencies.dart';

import 'erros.dart';

final class ParametrosFirebaseInit implements ParametersReturnResult {
  final FirebaseOptions options;
  @override
  final AppError error;

  ParametrosFirebaseInit({
    required this.options,
    required this.error,
  });
}

final class ParametrosRestClientResponse implements ParametersReturnResult {
  @override
  RestClientResponseError error;

  ParametrosRestClientResponse({
    required this.error,
  });
}
