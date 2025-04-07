import 'package:dependencies/dependencies.dart';

final class ParametrosFirebaseInit implements ParametersReturnResult {
  final FirebaseOptions options;
  @override
  final AppError error;

  ParametrosFirebaseInit({
    required this.options,
    required this.error,
  });
}
