import 'package:return_success_or_error/return_success_or_error.dart';

final class UserError implements AppError {
  @override
  String message;
  UserError({required this.message});
  @override
  String toString() {
    return "UserError - $message";
  }
}