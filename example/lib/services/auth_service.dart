import 'package:flutter/material.dart';

import 'package:flutter_okta_sdk/flutter_okta_sdk.dart';
import 'package:flutter_okta_sdk/base_request.dart';

class AuthOktaService {
  static const String oktaClientId = 'yourClientId';
  static const String oktaIssuerUrl = 'https://yourOktaLink/oauth2/default';
  static const String oktaDiscoveryUrl =
      'https://yourOktaLink/.well-known/openid-configuration';

  static const String oktaRedirectUri = 'yourOktaRedURI';
  static const String oktaLogoutRedirectUri = 'yourOktaLogoutUrl';
  var oktaSdk = FlutterOktaSdk();
  var oktaBaseRequest = BaseRequest(
    issuer: oktaIssuerUrl,
    clientId: oktaClientId,
    discoveryUrl: oktaDiscoveryUrl,
    endSessionRedirectUri: oktaLogoutRedirectUri,
    redirectUrl: oktaRedirectUri,
    scopes: ['openid', 'profile', 'email', 'offline_access'],
  );

  Future createConfig() async {
    await oktaSdk.createConfig(oktaBaseRequest);
  }

  Future authorize() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      await oktaSdk.signIn();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future logout() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      await oktaSdk.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getUser() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.getUser();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> isAuthenticated() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.isAuthenticated();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> getAccessToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.getAccessToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> getIdToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.getIdToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> revokeAccessToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.revokeAccessToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> revokeIdToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.revokeIdToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> revokeRefreshToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.revokeRefreshToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> clearTokens() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.clearTokens();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> introspectAccessToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.introspectAccessToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> introspectIdToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.introspectIdToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> introspectRefreshToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.introspectRefreshToken();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?> refreshToken() async {
    try {
      if (oktaSdk.isInitialized == false) {
        await createConfig();
      }
      return await oktaSdk.refreshTokens();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
