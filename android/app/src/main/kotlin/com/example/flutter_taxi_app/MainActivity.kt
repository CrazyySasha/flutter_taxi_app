package com.example.flutter_taxi_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    // MapKitFactory.setLocale("ru") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("9a8f6df4-4563-4c47-bb49-91fd007e7868") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }

}
