import 'package:article_browser/core/logging/logger.dart';
import 'package:talker/talker.dart';

class TalkerLogger implements Logger {
  final Talker talker;

  TalkerLogger() : talker = Talker(settings: TalkerSettings());

  @override
  void log(Object? something) {
    talker.info(something);
  }

  @override
  void handleError(Object error, StackTrace stackTrace) {
    talker.handle(error, stackTrace);
  }
}
