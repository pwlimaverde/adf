import 'package:return_success_or_error/return_success_or_error.dart';

final class TaskError implements AppError {
  @override
  String message;
  TaskError({required this.message});
  @override
  String toString() {
    return "TaskError - $message";
  }
}