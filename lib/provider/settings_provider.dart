import 'package:dicoding_flutter_fundamental/persist/services/shared_preferences_service.dart';
import 'package:dicoding_flutter_fundamental/services/local_notification_service.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final SharedPreferencesService preferencesService;
  final LocalNotificationService localNotificationService;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  late bool _dailyReminderEnable;

  bool get dailyReminderEnable => _dailyReminderEnable;

  final int _notificationId = 1;

  SettingsProvider(this.preferencesService, this.localNotificationService) {
    final settings = preferencesService.getSettingValue();
    _themeMode = settings.darkThemeEnable ? ThemeMode.dark : ThemeMode.light;
    _dailyReminderEnable = settings.dailyReminderEnable;
  }

  void toggleThemeMode() {
    _themeMode =
    (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    preferencesService.saveSettingValue(
      preferencesService.getSettingValue().copyWith(
          darkThemeEnable: _themeMode == ThemeMode.dark
      )
    );
    notifyListeners();
  }

  Future<void> toggleDailyReminder() async {
    _dailyReminderEnable = !_dailyReminderEnable;
    if (_dailyReminderEnable) {
      _scheduleDailyElevenAMNotification();
    } else {
      await _cancelNotification(_notificationId);
    }
    preferencesService.saveSettingValue(
      preferencesService.getSettingValue().copyWith(
          dailyReminderEnable: _dailyReminderEnable
      )
    );
    notifyListeners();
  }

  Future<bool?> requestPermissions() async {
    return localNotificationService.requestPermissions();
  }

  Future<void> _scheduleDailyElevenAMNotification() async {
    await localNotificationService.scheduleDailyElevenAMNotification(
      id: _notificationId,
    );
  }

  Future<void> _cancelNotification(int id) async {
    await localNotificationService.cancelNotification(id);
  }
}
