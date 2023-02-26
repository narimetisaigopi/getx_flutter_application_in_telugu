import 'package:flutter/material.dart';
import 'package:flutter_application_1/form_validation_screen.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/navigation_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      // home: const HomeScreen(),
      initialRoute: "/",
      getPages: [
        GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
        GetPage(
            name: NavigationScreen.routeName,
            page: () => const NavigationScreen())
      ],
    );
  }
}

// A > b > C == > Off
// A > b > c ==>  offAll
