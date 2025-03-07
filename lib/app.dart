import 'package:dicoding_flutter_fundamental/provider/settings_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/ds/themes/dark_theme.dart';
import 'core/ds/themes/light_theme.dart';
import 'flavors.dart';
import 'navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Eats Ease',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<SettingsProvider>(context).themeMode,
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      builder: (context, child) {
        return _flavorBanner(show: kDebugMode, child: child!);
      },
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) {
    return show
        ? Banner(
            location: BannerLocation.topStart,
            message: F.name,
            color: Colors.green.withAlpha(60),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
              letterSpacing: 1.0,
            ),
            textDirection: TextDirection.ltr,
            child: child,
          )
        : child;
  }
}
