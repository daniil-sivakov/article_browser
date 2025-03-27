import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings_cubit.dart';
import 'package:article_browser/presentation/localization/localization_plug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorButton extends StatelessWidget {
  const ThemeSelectorButton({super.key});

  @override
  Widget build(BuildContext context) {
    final UserSettingsCubit settingsCubit = context.watch<UserSettingsCubit>();
    final AppTheme currentTheme = settingsCubit.state.appTheme;

    final ColorScheme colorScheme = ColorScheme.of(context);

    return PopupMenuButton<AppTheme>(
      icon: Icon(Icons.brightness_6, color: colorScheme.onPrimary),
      onSelected: (AppTheme selectedTheme) {
        settingsCubit.changeTheme(selectedTheme);
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<AppTheme>>[
          PopupMenuItem<AppTheme>(
            value: AppTheme.light,
            child: _ThemeOptionTile(
              isSelected: currentTheme == AppTheme.light,
              iconData: Icons.light_mode,
              text: LocalizationPlug.themeLightLabel,
            ),
          ),
          PopupMenuItem<AppTheme>(
            value: AppTheme.dark,
            child: _ThemeOptionTile(
              isSelected: currentTheme == AppTheme.dark,
              iconData: Icons.dark_mode,
              text: LocalizationPlug.themeDarkLabel,
            ),
          ),
          PopupMenuItem<AppTheme>(
            value: AppTheme.system,
            child: _ThemeOptionTile(
              isSelected: currentTheme == AppTheme.system,
              iconData: Icons.brightness_auto,
              text: LocalizationPlug.themeSystemDefaultLabel,
            ),
          ),
        ];
      },
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  const _ThemeOptionTile({
    required this.isSelected,
    required this.iconData,
    required this.text,
  });

  final bool isSelected;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    final tileColor = isSelected ? ColorScheme.of(context).primary : null;

    return Row(
      children: [
        Icon(iconData, color: tileColor),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: tileColor)),
      ],
    );
  }
}
