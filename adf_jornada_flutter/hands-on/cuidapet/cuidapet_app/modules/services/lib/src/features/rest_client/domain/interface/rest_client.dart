import '../models/rest_client_response.dart';

abstract interface class RestClient {

  RestClient auth();
  RestClient unauth();

  Future<RestClientResponse<T>> post<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClientResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClientResponse<T>> put<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClientResponse<T>> delete<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClientResponse<T>> request<T>({
    required String path,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
