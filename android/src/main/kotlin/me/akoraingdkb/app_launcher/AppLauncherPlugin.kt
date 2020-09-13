package me.akoraingdkb.app_launcher

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.widget.Toast
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** AppLauncherPlugin */
class AppLauncherPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_launcher")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "openApp") {
            try {
                val intent: Intent? = call.argument<String>("applicationId")?.let { context.packageManager.getLaunchIntentForPackage(it) }

                if (intent != null) {
                    context.startActivity(intent)
                } else {
                    Toast.makeText(context, "No app was found with the application ID ${call.argument<String>("applicationId")}", Toast.LENGTH_LONG).show()
                }
            } catch (e: PackageManager.NameNotFoundException) {
                Toast.makeText(context, "No app was found with the application ID ${call.argument<String>("applicationId")}", Toast.LENGTH_LONG).show()
                result.error("APP_NOT_FOUND", "No app was found with the specified application ID", "Please specify a correct application ID");
            }
        } else {
            result.notImplemented()
        }

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
