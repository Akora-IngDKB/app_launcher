import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_launcher/app_launcher.dart';

void main() {
  const MethodChannel channel = MethodChannel('app_launcher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AppLauncher.platformVersion, '42');
  });
}
