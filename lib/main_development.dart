import 'package:dicoding_flutter_fundamental/features/dashboard/provider/restaurants_provider.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_details/provider/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart' as runner;
import 'core/provider/theme_provider.dart';
import 'di.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.development;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantsProvider(),
        ),
      ],
      child: const runner.App(),
    ),
  );
}
