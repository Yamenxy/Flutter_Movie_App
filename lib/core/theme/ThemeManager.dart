import 'package:flutter/material.dart';
import 'ColorPalette.dart';

abstract class Thememanager {
  static ThemeData getAppTheme(){
    return ThemeData(
      appBarTheme: AppBarTheme(
  backgroundColor: Colors.transparent,
        foregroundColor: Colorpalette.yellow,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          fontSize: 16,
          color: Colorpalette.yellow
        ),
  ),
      scaffoldBackgroundColor: Colorpalette.primaryColor,
      textTheme: TextTheme(
          titleLarge:TextStyle(
            fontSize: 20,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: Colorpalette.mainTextColor,
          ),
      )
      );
}
}