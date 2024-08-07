import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practiceaap/plans_and_teams.dart';
import 'package:practiceaap/splashscreen.dart';
import 'package:flutter/services.dart';

import 'ROUTES.dart';

void main() {
  // Set the status bar color to transparent and icons to black
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make status bar transparent (or set a color)
    statusBarIconBrightness: Brightness.dark, // Use dark icons on the status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/PlansandTeams', page: () => PlansandTeams()),

      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF333452), // Transparent status bar
            statusBarIconBrightness: Brightness.light, // Dark icons
          ),
        ),
      ),
    );
  }
}
