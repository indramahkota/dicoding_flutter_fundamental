class Settings {
  final bool darkThemeEnable;
  final bool dailyReminderEnable;

  Settings({
    required this.darkThemeEnable,
    required this.dailyReminderEnable,
  });

  Settings copyWith({
    bool? darkThemeEnable,
    bool? dailyReminderEnable,
  }) {
    return Settings(
      darkThemeEnable: darkThemeEnable ?? this.darkThemeEnable,
      dailyReminderEnable: dailyReminderEnable ?? this.dailyReminderEnable,
    );
  }
}
