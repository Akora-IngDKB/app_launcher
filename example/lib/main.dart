import 'package:flutter/material.dart';
import 'package:app_launcher/app_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LauncherScreen(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Arial',
      ),
    );
  }
}

class LauncherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Launcher Example',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCustomButton(
                  context,
                  title: 'Open Ludo Game',
                  onPressed: () async {
                    await AppLauncher.openApp(
                      androidApplicationId: "com.karuwaapps.ludo",
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildCustomButton(
                  context,
                  title: 'Check for Ludo Game',
                  onPressed: () async {
                    final isInstalled = await AppLauncher.hasApp(
                      androidApplicationId: "com.karuwaapps.ludo",
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isInstalled
                              ? 'Ludo Game is installed'
                              : 'Ludo Game is not installed',
                        ),
                        backgroundColor: Colors.black87,
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildCustomButton(
                  context,
                  title: 'Check for VLC',
                  onPressed: () async {
                    final isInstalled = await AppLauncher.hasApp(
                      androidApplicationId: "org.videolan.vlc",
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isInstalled
                              ? 'VLC is installed'
                              : 'VLC is not installed',
                        ),
                        backgroundColor: Colors.black87,
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildCustomButton(
                  context,
                  title: 'Open VLC',
                  onPressed: () async {
                    await AppLauncher.openApp(
                      androidApplicationId: "org.videolan.vlc",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context,
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepOrangeAccent,
        shadowColor: Colors.deepOrange,
        elevation: 10,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(title),
    );
  }
}
