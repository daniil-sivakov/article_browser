import 'package:article_browser/presentation/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:article_browser/core/di/core_module.dart';
import 'package:article_browser/domain/di/domain_module.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';

import 'di/fake_data_module.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  setUpAll(() {
    final Scope rootScope = CherryPick.openRootScope();
    rootScope.installModules([CoreModule(), FakeDataModule(), DomainModule()]);
  });

  testWidgets(
    'Ensure app is shown without errors',
    (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      final scaffoldLocator = find.byType(Scaffold);
      await expectLater(scaffoldLocator, findsOneWidget);
    },
    timeout: const Timeout(Duration(minutes: 5)),
  );

  testWidgets('Data is loaded successfully', (tester) async {
    await tester.pumpWidget(const App());
    final progressIndicatorLocator = find.byKey(Key('progress_indicator'));
    await tester.pumpAndSettle();
    await expectLater(progressIndicatorLocator, findsOneWidget);
    await tester.pumpAndSettle();
    await expectLater(progressIndicatorLocator, findsNothing);
    final listTileLocator = find.byType(ListTile);
    await expectLater(listTileLocator, findsAny);
  }, timeout: const Timeout(Duration(minutes: 5)));

  tearDownAll(() {
    CherryPick.closeRootScope();
  });
}
