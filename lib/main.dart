import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'package:movies_app/core/routes/AppRouter.dart';

import 'core/theme/ThemeManager.dart';

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
        LoginPage.routeName: (ctx) => const LoginPage(),
      },
      theme: Thememanager.getAppTheme(),
      onGenerateRoute: Approuter.onGenrateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New GP App')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome to the team starter app!'),
            const SizedBox(height: 8),
            Text('Button pressed: $_counter times',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
