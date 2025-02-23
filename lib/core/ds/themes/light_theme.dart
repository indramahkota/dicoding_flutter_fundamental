import 'package:dicoding_flutter_fundamental/core/ds/themes/color_schemes.dart';
import 'package:flutter/material.dart';

import '../typography/typography.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  navigationBarTheme: const NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  colorScheme: lightColorScheme,
  textTheme: customTextTheme,
);
