import 'package:dependencies/dependencies.dart';


class LoggerAppLogger implements AppLogger {
  final Logger _logger;

  LoggerAppLogger(Logger logger):_logger = logger;

  var _messages = <String>[];

  @override
  void append(String message) {
    _messages.add(message);
  }

  @override
  void closeApend() {
    info(_messages.join('\n'));
    _messages = [];
  }

  @override
  void debug(String message, [error, StackTrace? stackTrace]) =>
      _logger.d(message, error: error, stackTrace: stackTrace);

  @override
  void error(String message, [error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  @override
  void info(String message, [error, StackTrace? stackTrace]) =>
      _logger.i(message, error: error, stackTrace: stackTrace);

  @override
  void warning(String message, [error, StackTrace? stackTrace]) =>
      _logger.w(message, error: error, stackTrace: stackTrace);
}
