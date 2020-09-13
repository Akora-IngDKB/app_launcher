import 'dart:async';

import 'package:flutter/services.dart';

class AppLauncher {
  static const MethodChannel _channel = const MethodChannel('app_launcher');

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
