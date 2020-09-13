import 'dart:async';

import 'package:flutter/services.dart';

class AppLauncher {
  static const MethodChannel _channel = const MethodChannel('app_launcher');

  /// Attempt to open the app on the device with the [`androidApplicationId`].
  /// [`androidApplicationId`] should not be empty or null.
  ///
  /// Will display a toast if no app is found.
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
