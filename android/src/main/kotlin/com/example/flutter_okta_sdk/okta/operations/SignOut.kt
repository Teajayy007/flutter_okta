package com.example.flutter_okta_sdk.okta.operations

import android.app.Activity
import com.okta.oidc.clients.web.WebAuthClient
import com.example.flutter_okta_sdk.okta.entities.OktaClient
import com.example.flutter_okta_sdk.okta.entities.PendingOperation

fun signOut(activity: Activity) {
    registerCallback(activity)
    OktaClient.getWebClient().signOutOfOkta(activity)
}