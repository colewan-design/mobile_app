import 'package:cboo_mobile_app/home_page.dart';
import 'package:cboo_mobile_app/user/message_page.dart';
import 'package:flutter/material.dart';
import 'package:cboo_mobile_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? token; // Make the token parameter optional by adding '?'

  const MyApp({Key? key, this.token}) : super(key: key);

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
      home: const SplashScreen(),
      routes: {
        '/chat': (context) => MessagePage(
            userName: 'SampleName', userEmail: 'sampleEmail@email.com'),
        '/home': (context) =>
            MyHomePage(title: 'SampleTitle', token: token ?? ''),
        // Use 'token ?? '' to provide a default empty string if token is null
      },
    );
  }
}
