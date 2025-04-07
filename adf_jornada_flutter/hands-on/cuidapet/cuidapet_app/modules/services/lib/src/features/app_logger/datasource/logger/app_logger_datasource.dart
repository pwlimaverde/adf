import 'package:dependencies/dependencies.dart';

import 'logger_app_logger.dart';

///Datasources
final class LoggerAppLoggertDatasource implements Datasource<AppLogger> {
  final Logger _logger;

  LoggerAppLoggertDatasource(Logger logger) : _logger = logger;
  @override
  Future<AppLogger> call(NoParams parameters) async {
    try {
      final appLogger = LoggerAppLogger(_logger);

      return appLogger;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
