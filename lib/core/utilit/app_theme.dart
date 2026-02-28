import 'package:flutter/material.dart';

import 'colors_app.dart';

class AppTheme{
  static final ThemeData darkTheme=ThemeData(
    //تحديد ان التطبيق يتبع المظهر الداكن
    brightness: Brightness.dark,
    // تحديد لون خلفية كل الشاشات بشكل تلقائي
    scaffoldBackgroundColor:AppColors.lightBlackColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
      ),
    ),
  );
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
  );
}