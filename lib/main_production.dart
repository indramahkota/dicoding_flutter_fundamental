import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'core/ds/theme_provider.dart';
import 'di.dart';
import 'flavors.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const runner.MyApp(),
    ),
  );
}
