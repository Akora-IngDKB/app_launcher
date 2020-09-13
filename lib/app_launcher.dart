import 'dart:async';

import 'package:flutter/services.dart';

class AppLauncher {
  static const MethodChannel _channel = const MethodChannel('app_launcher');

  /// Check if the app with [`androidApplicationId`] is installed on the device.
  ///
  /// Returns `true` if found or `false` otherwise.
  ///
  /// [`androidApplicationId`] should not be empty or null.
  static Future<bool> hasApp({String androidApplicationId}) async {
    assert(
      androidApplicationId != null && androidApplicationId.isNotEmpty,
      "[androidApplicationId] cannot be null or empty",
    );

    final result = await _channel.invokeMethod<bool>(
      'hasApp',
      <String, Object>{
        'applicationId': androidApplicationId,
      },
    );

    return result;
  }

  /// Attempt to open the app on the device with the [`androidApplicationId`].
  ///
  /// Will display a toast if no app is found.
  ///
  /// [`androidApplicationId`] should not be empty or null.
  static Future<void> openApp({String androidApplicationId}) async {
    assert(
      androidApplicationId != null && androidApplicationId.isNotEmpty,
      "[androidApplicationId] cannot be null or empty",
    );

    await _channel.invokeMethod(
      'openApp',
      <String, Object>{
        'applicationId': androidApplicationId,
      },
    );
  }
}
