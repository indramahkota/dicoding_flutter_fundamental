import 'package:dicoding_flutter_fundamental/core/ds/themes/dark_theme.dart';
import 'package:dicoding_flutter_fundamental/core/ds/themes/light_theme.dart';
import 'package:dicoding_flutter_fundamental/persist/services/shared_preferences_service.dart';
import 'package:dicoding_flutter_fundamental/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SettingsProvider with ChangeNotifier {
  final SharedPreferencesService preferencesService;
  final LocalNotificationService localNotificationService;

  late ThemeData _themeData;
  late bool _dailyReminderEnable;

  ThemeData get themeData => _themeData;

  bool get dailyReminderEnable => _dailyReminderEnable;

  final int _notificationId = 1111118881;

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  SettingsProvider(this.preferencesService, this.localNotificationService) {
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

  Future<void> toggleDailyReminder() async {
    _dailyReminderEnable = !_dailyReminderEnable;
    if (_dailyReminderEnable) {
      _scheduleDailyTenAMNotification();
    } else {
      await _cancelNotification(_notificationId);
    }
    preferencesService.saveSettingValue(
      preferencesService.getSettingValue().copyWith(
            dailyReminderEnable: _dailyReminderEnable,
          ),
    );
    notifyListeners();
  }

  Future<bool?> requestPermissions() async {
    return localNotificationService.requestPermissions();
  }

  Future<void> _scheduleDailyTenAMNotification() async {
    await localNotificationService.scheduleDailyElevenAMNotification(
      id: _notificationId,
    );
  }

  Future<void> _cancelNotification(int id) async {
    await localNotificationService.cancelNotification(id);
  }
}
