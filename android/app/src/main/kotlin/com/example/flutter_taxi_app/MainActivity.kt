package com.example.flutter_taxi_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    // MapKitFactory.setLocale("ru") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("6b43ad6f-4098-411e-91cd-796af0f13e5b") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }

}
