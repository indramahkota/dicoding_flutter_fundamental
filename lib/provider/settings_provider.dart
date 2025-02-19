import 'package:dicoding_flutter_fundamental/core/ds/themes/dark_theme.dart';
import 'package:dicoding_flutter_fundamental/core/ds/themes/light_theme.dart';
import 'package:dicoding_flutter_fundamental/persist/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final SharedPreferencesService preferencesService;

  late ThemeData _themeData;
  late bool _dailyReminderEnable;

  ThemeData get themeData => _themeData;

  bool get dailyReminderEnable => _dailyReminderEnable;

  SettingsProvider(this.preferencesService) {
    final settings = preferencesService.getSettingValue();
    _themeData = settings.darkThemeEnable ? darkMode : lightMode;
    _dailyReminderEnable = settings.dailyReminderEnable;
  }

  void toggleThemeMode() {
    _themeData = (_themeData == lightMode) ? darkMode : lightMode;
    preferencesService.saveSettingValue(
      preferencesService.getSettingValue().copyWith(
            darkThemeEnable: _themeData == darkMode,
          ),
    );
    notifyListeners();
  }

  void toggleDailyReminder() {
    _dailyReminderEnable = !_dailyReminderEnable;
    preferencesService.saveSettingValue(
      preferencesService.getSettingValue().copyWith(
            dailyReminderEnable: _dailyReminderEnable,
          ),
    );
    notifyListeners();
  }
}
