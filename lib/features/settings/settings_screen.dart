import 'package:dicoding_flutter_fundamental/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      height: 40 / 32,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            elevation: 4,
          ),
          body: _buildBody(settingsProvider),
        );
      },
    );
  }

  Widget _buildBody(SettingsProvider settingsProvider) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Restaurant Notification",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 8, right: 8),
          child: Row(
            children: [
              const Expanded(child: Text("Enable Notifications")),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: settingsProvider.dailyReminderEnable,
                  onChanged: (newValue) async {
                    await settingsProvider.toggleDailyReminder();
                  },
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        const Text(
          "Theme",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              const Expanded(child: Text("Dark or Light Theme")),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {
                    settingsProvider.toggleThemeMode();
                  },
                  icon: Icon(
                    settingsProvider.themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    size: 30,
                    color: settingsProvider.themeMode == ThemeMode.dark
                        ? Colors.yellow[300]
                        : Colors.blue[300],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
