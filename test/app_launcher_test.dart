import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_launcher/app_launcher.dart';

void main() {
  const MethodChannel channel = MethodChannel('me.akoraingdkb.app_launcher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'hasApp') {
        return true;
      }

      return false;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('hasApp', () async {
    expect(
        await AppLauncher.hasApp(androidApplicationId: 'com.whatsapp'), true);
  });

  test('openApp', () async {
    expect(
        AppLauncher.openApp(androidApplicationId: 'com.whatsapp'), isA<void>());
  });
}
