import 'package:dicoding_flutter_fundamental/app.dart';
import 'package:dicoding_flutter_fundamental/provider/bookmark_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurant_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurants_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<SettingsProvider>()),
        ChangeNotifierProvider.value(value: getIt<RestaurantProvider>()),
        ChangeNotifierProvider.value(value: getIt<RestaurantsProvider>()),
        ChangeNotifierProvider.value(value: getIt<BookmarkProvider>()),
      ],
      child: const App(),
    );
  }
}
