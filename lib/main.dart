import 'package:flutter/material.dart';
import 'package:cboo_mobile_app/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define your theme here
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
          primarySwatch: Colors.teal,
          tabBarTheme: const TabBarTheme(
            labelColor: Color.fromARGB(
                255, 5, 97, 62), // Set the color for the selected tab label
          ),
        ),
        home: const SplashScreen());
  }
}

