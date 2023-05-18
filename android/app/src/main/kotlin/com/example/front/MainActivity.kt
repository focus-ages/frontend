package com.example.front

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "channel_name"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "enableGrayscale" -> {
                    GrayscaleAccessibilityService.enableGrayscale(applicationContext)
                    result.success(null)
                }
                "disableGrayscale" -> {
                    GrayscaleAccessibilityService.disableGrayscale(applicationContext)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }
}