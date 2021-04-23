import 'package:flutter/material.dart';

import 'package:app_launcher/app_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Launcher Example'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await AppLauncher.openApp(
                    androidApplicationId: "com.whatsapp",
                  );
                },
                child: Text('Open WhatsApp'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final value = await AppLauncher.hasApp(
                    androidApplicationId: "org.videolan.vlc",
                  );

                  print(value);
                },
                child: Text('Check for VLC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
