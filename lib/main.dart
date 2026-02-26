import 'package:flutter/material.dart';
import 'package:new_gp_app/core/routes/AppRouter.dart';
import 'package:new_gp_app/core/routes/PageRouteNames.dart';

import 'core/theme/ThemeManager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Thememanager.getAppTheme(),
      initialRoute: Pageroutenames.updateScreen,
      onGenerateRoute: Approuter.onGenrateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
