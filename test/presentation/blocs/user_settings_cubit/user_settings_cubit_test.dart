import 'dart:convert';

import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<LocalStorageProvider>()])
import 'user_settings_cubit_test.mocks.dart';

void main() {
  late MockLocalStorageProvider localStorageProvider;

  setUp(() {
    localStorageProvider = MockLocalStorageProvider();
  });

  blocTest(
    'Cubit init grabs app theme from local storage on init()',
    build: () {
      when(localStorageProvider.get(any)).thenAnswer((_) async {
        return jsonEncode(UserSettings(appTheme: AppTheme.light).toJson());
      });
      return UserSettingsCubit(localStorageProvider);
    },
    act: (cubit) => cubit.init(),
    wait: const Duration(milliseconds: 20),
    expect: () => [UserSettings(appTheme: AppTheme.light)],
    verify: (_) {
      verify(localStorageProvider.get(any)).called(1);
    },
  );
  blocTest(
    'Cubit sets app theme successfully',
    build: () => UserSettingsCubit(localStorageProvider),
    act: (cubit) => cubit.changeTheme(AppTheme.dark),
    expect: () => [UserSettings(appTheme: AppTheme.dark)],
    verify: (_) {
      verify(
        localStorageProvider.set(
          key: anyNamed('key'),
          value: anyNamed('value'),
        ),
      );
    },
  );
}
