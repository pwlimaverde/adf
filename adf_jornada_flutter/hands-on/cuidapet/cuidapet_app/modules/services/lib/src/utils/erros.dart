import 'package:dependencies/dependencies.dart';

final class RestClientResponseError implements AppError {
  int? statusCode;
  dynamic error;
  RestClientResponseModel? response;
  @override
  String message;
  RestClientResponseError({
    required this.message,
    this.statusCode,
    this.error,
    this.response,
  });
  @override
  String toString() {
    return "RestClientResponseError - $message";
  }
}
