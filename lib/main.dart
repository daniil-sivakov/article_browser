import 'dart:async';

import 'package:article_browser/core/di/core_module.dart';
import 'package:article_browser/core/logging/logger.dart';
import 'package:article_browser/data/di/data_module.dart';
import 'package:article_browser/domain/di/domain_module.dart';
import 'package:article_browser/presentation/app.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  final Scope rootScope = CherryPick.openRootScope();

  try {
    rootScope.installModules([CoreModule()]);
  } on Object {
    runApp(Center(child: FlutterLogo()));
    rethrow;
  }

  runZonedGuarded(
    () {
      rootScope.installModules([DataModule(), DomainModule()]);

      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]);
      runApp(const App());
    },
    (error, stackTrace) {
      rootScope.resolve<Logger>().handleError(error, stackTrace);
    },
  );
}
