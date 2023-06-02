import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather_app/Screens/Home%20Page.dart';

import 'Screens/weather screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromRGBO(241, 240, 246, 1.0)
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromRGBO(20, 12, 54, 1.0),
      ),
      themeMode: ThemeMode.dark,
      home: HomePageScreen(),
    );
  }
}
