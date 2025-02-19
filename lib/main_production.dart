import 'package:dicoding_flutter_fundamental/main.dart';
import 'package:flutter/cupertino.dart';

import 'di.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const Main());
}
