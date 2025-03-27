import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

enum AppTheme { light, dark, system }

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({required AppTheme appTheme}) = _UserSettings;

  factory UserSettings.fromJson(Map<String, Object?> json) =>
      _$UserSettingsFromJson(json);
}
