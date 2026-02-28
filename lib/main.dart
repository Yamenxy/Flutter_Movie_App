import 'package:flutter/material.dart';

import 'core/utilit/app_theme.dart';
import 'features/splash/view/onboarding_page.dart';
import 'features/splash/view/splash_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        //Onboarding4.routeName: (context) => const Onboarding4(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

