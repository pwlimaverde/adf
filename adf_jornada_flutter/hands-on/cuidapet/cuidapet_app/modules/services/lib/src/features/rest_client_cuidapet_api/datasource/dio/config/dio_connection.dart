import 'package:dependencies/dependencies.dart';

final class DioConnection {
  static DioConnection? _instance;
  DioConnection._();
  factory DioConnection() {
    _instance ??= DioConnection._();
    return _instance!;
  }

  Dio getInstanceAuth() {
    final defautOptions = BaseOptions(
      baseUrl: ConstsCore.baseUrl,
      connectTimeout: Duration(milliseconds: ConstsCore.connectTimeoutMilliseconds),
      receiveTimeout: Duration(milliseconds: ConstsCore.receiveTimeoutMilliseconds),
    );
    defautOptions.extra['auth'] = true;
    final dio = Dio(defautOptions);

    return dio;
  }

  Dio getInstanceUnAuth() {
    final defautOptions = BaseOptions(
      baseUrl: ConstsCore.baseUrl,
      connectTimeout: Duration(milliseconds: ConstsCore.connectTimeoutMilliseconds),
      receiveTimeout: Duration(milliseconds: ConstsCore.receiveTimeoutMilliseconds),
    );
    defautOptions.extra['auth'] = false;
    final dio = Dio(defautOptions);

    return dio;
  }
}
