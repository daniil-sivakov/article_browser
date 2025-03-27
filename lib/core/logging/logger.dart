abstract class Logger {
  void log(Object? something);

  void handleError(Object error, StackTrace stackTrace);
}
