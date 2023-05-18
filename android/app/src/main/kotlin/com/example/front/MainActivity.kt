package com.example.front

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {
    private val CHANNEL = "channel_name"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "enableGrayscale") {
                enableGrayscale()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun enableGrayscale() {
        GlobalScope.launch(Dispatchers.Main) {
            // Verifique se você tem as permissões necessárias aqui
            // ...

            Util.toggleGrayscale(applicationContext, !Util.isGrayscaleEnabled(applicationContext))
            finish()
        }
    }
}