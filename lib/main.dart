import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      initialRoute: OnboardingPage.routeName,
      routes: {
        '/': (ctx) => const Scaffold(
              body: Center(child: Text('App root — use your app routes here')),
            ),
        OnboardingPage.routeName: (ctx) => const OnboardingPage(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
      },
    );
  }
}
