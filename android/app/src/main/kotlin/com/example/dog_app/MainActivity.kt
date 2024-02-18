package com.example.dog_app

import io.flutter.embedding.android.FlutterActivity
import android.os.Build
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "platform_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getOSVersion") {
                result.success(getOSVersion())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getOSVersion(): String {
        return Build.VERSION.RELEASE
    }
}