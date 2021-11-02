import 'package:flutter/material.dart';
import 'package:flutter_okta_sdk_example/services/auth_service.dart';

class AuthProvider extends InheritedWidget {
  final AuthOktaService authService;

  const AuthProvider(
      {Key? key, required this.authService, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AuthProvider>();
}
