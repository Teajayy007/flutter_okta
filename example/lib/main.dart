import 'package:flutter/material.dart';

import 'providers/okta_provider.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/splash_screen.dart';
import 'services/auth_service.dart';

void main() => runApp((const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      authService: AuthOktaService(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          MainScreen.routeName: (ctx) => const MainScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen()
        },
      ),
    );
  }
}
