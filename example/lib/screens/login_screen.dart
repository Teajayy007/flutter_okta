import 'package:flutter/material.dart';
import 'package:flutter_okta_sdk_example/providers/okta_provider.dart';

import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () async {
          await AuthProvider.of(context)?.authService.authorize().whenComplete(
              () => Navigator.of(context).pushNamed(MainScreen.routeName));
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
            backgroundColor: MaterialStateProperty.all(
              Colors.green,
            )),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Sign In',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      )),
    );
  }
}
