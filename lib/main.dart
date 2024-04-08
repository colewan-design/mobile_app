import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:cboo_mobile_app/home_page.dart';
import 'package:cboo_mobile_app/user/profile_page.dart';

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
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal, // Set the primary color
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Color.fromARGB(
                255, 5, 97, 62), // Set the color for the selected tab label
          ),
        ),
        home: const SplashScreen());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Icon-192.png'),
            const SizedBox(
                height: 20), // Add spacing betwe_appen image and text
            const Text(
              'CBOO Portal',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
      nextScreen: const LoginPage(),
      splashIconSize: 500,
    );
  }
}
