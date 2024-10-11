import 'package:return_success_or_error/return_success_or_error.dart';

final class AuthError implements AppError {
  @override
  String message;
  AuthError({required this.message});
  @override
  String toString() {
    return "ErrorGeneric - $message";
  }
}