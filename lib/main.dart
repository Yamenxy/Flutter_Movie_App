import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/main_shell.dart';
import 'screens/onboarding.dart';

import 'core/utilit/app_theme.dart';
import 'features/splash/view/onboarding_page.dart';
import 'features/splash/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        OnboardingScreens.routeName: (context) => const OnboardingScreens(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        MainShell.routeName: (context) => const MainShell(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
