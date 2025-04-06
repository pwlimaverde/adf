// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dependencies/dependencies.dart';

import '../../../../utils/erros.dart';

import 'config/dio_connection.dart';

class DioRestCuidaPetApiClient implements RestClientCuidaPet {
  final DioConnection _dioConnection;
  Dio? _dio;

  DioRestCuidaPetApiClient(DioConnection dioConnection)
      : _dioConnection = dioConnection;
  @override
  RestClientCuidaPet auth() {
    _dio = _dioConnection.getInstanceAuth();
    return this;
  }

  @override
  RestClientCuidaPet unAuth() {
    _dio = _dioConnection.getInstanceUnAuth();
    return this;
  }

  @override
  Future<RestClientResponseModel<T>> delete<T>({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _dio ??= _dioConnection.getInstanceUnAuth();
      final response = await _dio!.delete(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponseModel<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _dio ??= _dioConnection.getInstanceUnAuth();
      final response = await _dio!.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponseModel<T>> patch<T>({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _dio ??= _dioConnection.getInstanceUnAuth();
      final response = await _dio!.patch(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponseModel<T>> post<T>({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _dio ??= _dioConnection.getInstanceUnAuth();
      final response = await _dio!.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponseModel<T>> put<T>({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _dio ??= _dioConnection.getInstanceUnAuth();
      final response = await _dio!.put(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponseModel<T>> request<T>({
    required String path,
    required String method,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _dio ??= _dioConnection.getInstanceUnAuth();
      final response = await _dio!.delete(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
          method: method,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  Future<RestClientResponseModel<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClientResponseModel<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientExeption(DioException dioExeption) {
    final response = dioExeption.response;
    throw RestClientResponseError(
      error: dioExeption.error,
      statusCode: response?.statusCode,
      message: response?.statusMessage ?? '',
      response: RestClientResponseModel(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
