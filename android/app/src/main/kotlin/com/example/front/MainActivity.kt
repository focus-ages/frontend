package com.example.front

import android.os.Build
import android.view.WindowManager
import android.graphics.ColorMatrix
import android.graphics.ColorMatrixColorFilter
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
  private val CHANNEL = "channel_name"

  override fun onCreate(savedInstanceState: Bundle?) {
      super.onCreate(savedInstanceState)

      MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
          if (call.method == "enableGrayscale") {
              GrayscaleAccessibilityService.enableGrayscale(applicationContext)
              result.success(null)
          } else if (call.method == "disableGrayscale") {
              GrayscaleAccessibilityService.disableGrayscale(applicationContext)
              result.success(null)
          } else {
              result.notImplemented()
          }
      }
  }
}