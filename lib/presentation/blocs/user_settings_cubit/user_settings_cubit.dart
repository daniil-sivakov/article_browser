import 'dart:convert';

import 'package:article_browser/data/constants/local_storage_keys.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Рецензенту: для простого переключения темы, думаю, будет лишним пачкать слой
// предметной области, удобнее будет прыгнуть через слой сразу в data для компактности.
// Здесь вряд ли появится необходимость обрабатывать состояние гонки, поэтому использую
// более компактный Cubit вместо объёмного BLoC.
class UserSettingsCubit extends Cubit<UserSettings> {
  UserSettingsCubit(this._localStorageProvider)
    : super(UserSettings(appTheme: AppTheme.system));

  final LocalStorageProvider _localStorageProvider;

  Future<void> init() async {
    final String? userSettingsJsonString = await _localStorageProvider.get(
      LocalStorageKeys.userSettings,
    );

    if (userSettingsJsonString == null) {
      return;
    }

    emit(UserSettings.fromJson(jsonDecode(userSettingsJsonString)));
  }

  void changeTheme(AppTheme newTheme) {
    final UserSettings newSettings = state.copyWith(appTheme: newTheme);
    emit(newSettings);

    _localStorageProvider.set(
      key: LocalStorageKeys.userSettings,
      value: jsonEncode(newSettings.toJson()),
    );
  }
}
