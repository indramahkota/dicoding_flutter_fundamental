import 'package:dicoding_flutter_fundamental/main.dart';
import 'package:flutter/material.dart';

import 'di.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.development;
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const Main());
}
