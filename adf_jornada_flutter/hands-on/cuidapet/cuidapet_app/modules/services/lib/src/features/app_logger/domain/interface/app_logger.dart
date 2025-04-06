
abstract interface class AppLogger {

  void debug(String message, [dynamic error, StackTrace? stackTrace]);
  void error(String message, [dynamic error, StackTrace? stackTrace]);
  void warning(String message, [dynamic error, StackTrace? stackTrace]);
  void info(String message, [dynamic error, StackTrace? stackTrace]);
  void append(String message);
  void closeApend();

}
