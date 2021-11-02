package com.example.flutter_okta_sdk.okta.operations

import com.okta.oidc.clients.web.WebAuthClient
import com.example.flutter_okta_sdk.okta.entities.OktaClient
import com.example.flutter_okta_sdk.okta.entities.PendingOperation

fun isAuthenticated() {
    val sessionClient = OktaClient.getWebClient().sessionClient
    PendingOperation.success(sessionClient.isAuthenticated)
}


