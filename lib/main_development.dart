import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/provider/theme_provider.dart';
import 'di.dart';
import 'flavors.dart';
import 'app.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.development;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const runner.App(),
    ),
  );
}
