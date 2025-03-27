import 'package:article_browser/core/logging/logger.dart';
import 'package:article_browser/core/logging/talker_logger.dart';
import 'package:cherrypick/cherrypick.dart';

class CoreModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<Logger>().toInstance(TalkerLogger());
  }
}
