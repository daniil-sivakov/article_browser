import 'package:article_browser/presentation/app.dart';
import 'package:article_browser/presentation/widgets/comment_card.dart';
import 'package:article_browser/presentation/widgets/theme_selector_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:article_browser/core/di/core_module.dart';
import 'package:article_browser/domain/di/domain_module.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';

import 'di/fake_data_module.dart';
import 'utilities.dart';

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
    await tester.pumpAndSettle();
    final listTileLocator = find.byType(ListTile);

    await expectLater(listTileLocator, findsAny);
  }, timeout: const Timeout(Duration(minutes: 1)));

  testWidgets('Can select theme', (tester) async {
    late Text appTitleText;
    late Color titleColor;

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    appTitleText = tester.widget<Text>(find.text('Articles'));
    titleColor = appTitleText.style!.color!;
    final initialBrightness = TestUtilities.computeBrightness(titleColor);

    final themeSelectorLocator = find.byType(ThemeSelectorButton);
    await tester.tap(themeSelectorLocator);
    await tester.pumpAndSettle();

    final Finder darkThemeIconLocator = find.byIcon(Icons.dark_mode);
    await tester.tap(darkThemeIconLocator);
    await tester.pumpAndSettle();
    appTitleText = tester.widget<Text>(find.text('Articles'));
    titleColor = appTitleText.style!.color!;
    final brightnessAfterDarkThemeIconTap = TestUtilities.computeBrightness(
      titleColor,
    );

    await tester.tap(themeSelectorLocator);
    await tester.pumpAndSettle();
    final Finder lightThemeIconLocator = find.byIcon(Icons.light_mode);
    await tester.tap(lightThemeIconLocator);
    await tester.pumpAndSettle();
    appTitleText = tester.widget<Text>(find.text('Articles'));
    titleColor = appTitleText.style!.color!;
    final brightnessAfterLightThemeIconTap = TestUtilities.computeBrightness(
      titleColor,
    );

    expect(initialBrightness, Brightness.light);
    expect(brightnessAfterDarkThemeIconTap, Brightness.dark);
    expect(brightnessAfterLightThemeIconTap, Brightness.light);
  }, timeout: const Timeout(Duration(minutes: 1)));

  testWidgets('Can navigate to details', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    final listTileLocator = find.byType(ListTile);
    await tester.tap(listTileLocator.first);
    await tester.pumpAndSettle();
    final detailsScaffoldLocator = find.byKey(Key('details_scaffold'));

    expect(detailsScaffoldLocator, findsOneWidget);
  }, timeout: const Timeout(Duration(minutes: 1)));

  testWidgets(
    'Comments reside in details screen content',
    (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      final listTileLocator = find.byType(ListTile);
      await tester.tap(listTileLocator.first);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      final commentLocator = find.byType(CommentCard);

      await expectLater(commentLocator, findsAny);
    },
    timeout: const Timeout(Duration(minutes: 1)),
  );

  tearDownAll(() {
    CherryPick.closeRootScope();
  });
}
