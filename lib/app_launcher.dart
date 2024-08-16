import 'dart:async';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import for URL launching

class AppLauncher {
  static const MethodChannel _channel =
      const MethodChannel('me.akoraingdkb.app_launcher');

  /// Check if the app with [`androidApplicationId`] is installed on the device.
  ///
  /// Returns `true` if found or `false` otherwise.
  ///
  /// [`androidApplicationId`] should not be empty or null.
  static Future<bool> hasApp({required String androidApplicationId}) async {
    assert(
      androidApplicationId.isNotEmpty,
      "[androidApplicationId] cannot be empty",
    );

    final result = await _channel.invokeMethod<bool>(
      'hasApp',
      <String, Object>{
        'applicationId': androidApplicationId,
      },
    );

    return result ?? false;
  }

  /// Attempt to open the app on the device with the [`androidApplicationId`].
  ///
  /// Will display a toast if no app is found, and redirect to Google Play Store if needed.
  ///
  /// [`androidApplicationId`] should not be empty or null.
  static Future<void> openApp({required String androidApplicationId}) async {
    assert(
      androidApplicationId.isNotEmpty,
      "[androidApplicationId] cannot be empty",
    );

    final isAppInstalled =
        await hasApp(androidApplicationId: androidApplicationId);

    if (isAppInstalled) {
      await _channel.invokeMethod(
        'openApp',
        <String, Object>{
          'applicationId': androidApplicationId,
        },
      );
    } else {
      final playStoreUrl =
          'https://play.google.com/store/apps/details?id=$androidApplicationId';
      if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
        await launchUrl(Uri.parse(playStoreUrl));
      } else {
        // Handle the error if the URL cannot be launched
        throw 'Could not open the Play Store.';
      }
    }
  }
}
