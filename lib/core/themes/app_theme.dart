import 'package:flutter/material.dart';

import '../../core/values/colors.dart';
import 'text_theme.dart';

abstract class AppThemeData {
  static final ThemeData _baseTheme = ThemeData(
    primaryColor: colorAqua,
    primaryColorLight: colorGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: appTextTheme,
    dialogBackgroundColor: colorWhite,
    scaffoldBackgroundColor: colorWhite
  );

  static ThemeData getThemeData() {
    return _baseTheme.copyWith(
      colorScheme: _baseTheme.colorScheme.copyWith(
        onBackground: Colors.white60,
        onPrimary: Colors.white70,
        onSecondary: Colors.white60,
      ),
    );
  }
}