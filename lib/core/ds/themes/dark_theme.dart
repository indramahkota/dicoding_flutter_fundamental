import 'package:dicoding_flutter_fundamental/core/ds/themes/color_schemes.dart';
import 'package:flutter/material.dart';

import '../typography/typography.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  navigationBarTheme: const NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  colorScheme: darkColorScheme,
  textTheme: customTextTheme,
);
