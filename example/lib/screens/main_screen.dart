import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter_okta_sdk_example/providers/okta_provider.dart';

import '../button.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  parseUser(Map<String, dynamic> json) {
    return json['name'] as String;
  }

  @override
  Widget build(BuildContext context) {
    final service = AuthProvider.of(context)?.authService;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyButton(
                  press: () async {
                    var userJson = await service!.getUser();
                    print(userJson);
                    Map<String, dynamic> user = jsonDecode(userJson);

                    debugPrint("User is: ${user['name']}");
                  },
                  title: 'Get User',
                ),
                MyButton(
                  press: () async {
                    await service!.logout();
                    Navigator.of(context).pushReplacementNamed('/splash');
                  },
                  title: 'logout',
                ),
                MyButton(
                    press: () async {
                      var isAuthenticated = await service!.isAuthenticated();
                      debugPrint(
                          "isAuthenticated: ${isAuthenticated.toString()}");
                    },
                    title: 'isAuthenticated'),
                MyButton(
                    press: () async {
                      var accessToken = await service!.getAccessToken();
                      debugPrint("AccessToken: $accessToken");
                    },
                    title: 'GetAccessToken'),
                MyButton(
                    press: () async {
                      var idToken = await service!.getIdToken();
                      debugPrint("idToken: $idToken");
                    },
                    title: 'GetIdToken'),
                MyButton(
                  press: () async {
                    var result = await service?.revokeAccessToken();
                    debugPrint("result: $result");
                    Navigator.of(context).pushReplacementNamed('/splash');
                  },
                  title: 'RemAccToken',
                ),
                MyButton(
                  press: () async {
                    var result = await service!.revokeIdToken();
                    debugPrint("result: $result");
                    Navigator.of(context).pushReplacementNamed('/splash');
                  },
                  title: 'RevokeId',
                ),
                const SizedBox(height: 30),
                MyButton(
                  press: () async {
                    var result = await service!.revokeRefreshToken();
                    debugPrint("result: $result");
                    Navigator.of(context).pushReplacementNamed('/splash');
                  },
                  title: 'RevokeRefresh',
                ),
                const SizedBox(height: 30),
                MyButton(
                  press: () async {
                    var result = await AuthProvider.of(context)
                        ?.authService
                        .clearTokens();
                    debugPrint("result: $result");
                    Navigator.of(context).pushReplacementNamed('/splash');
                  },
                  title: 'clearTokens',
                ),
                MyButton(
                  press: () async {
                    var result = await service!.introspectAccessToken();
                    debugPrint("introspectAccessToken: $result");
                  },
                  title: 'IntrospectAccessToken',
                ),
                MyButton(
                  press: () async {
                    var result = await service!.introspectIdToken();
                    debugPrint("introspectIdToken: $result");
                  },
                  title: 'IntroSpectIdToken',
                ),
                MyButton(
                  press: () async {
                    var result = await service!.introspectRefreshToken();
                    debugPrint("introspectRefreshToken: $result");
                  },
                  title: 'IntrospectRefreshToken',
                ),
                MyButton(
                  press: () async {
                    var result = await service!.refreshToken();
                    debugPrint("refreshTokens: $result");
                  },
                  title: 'RefreshToken',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
