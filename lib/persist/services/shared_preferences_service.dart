import 'package:dicoding_flutter_fundamental/core/domain/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String _keyNotification = "MY_NOTIFICATION";
  static const String _keyDarkTheme = "MY_THEME";

  Future<void> saveSettingValue(Settings setting) async {
    try {
      await _preferences.setBool(_keyNotification, setting.dailyReminderEnable);
      await _preferences.setBool(_keyDarkTheme, setting.darkThemeEnable);
    } catch (e) {
      throw Exception("Shared preferences cannot save the setting value.");
    }
  }

  Settings getSettingValue() {
    return Settings(
      dailyReminderEnable: _preferences.getBool(_keyNotification) ?? false,
      darkThemeEnable: _preferences.getBool(_keyDarkTheme) ?? false,
    );
  }
}
