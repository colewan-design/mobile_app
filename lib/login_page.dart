import 'dart:convert';
import 'package:cboo_mobile_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool isLoading = false; // Track loading state

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Show loader when logging in
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.110.72/login'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'accept': 'application/json',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              title: 'CBOO',
              token: token,
            ),
          ),
        );
      } else {
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'] ??
            'Login failed. Please check your credentials.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Hide loader after login attempt
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    onChanged: (value) => email = value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Add Email',
                      hintStyle: ThemeTextStyle.loginTextFieldStyle,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) => password = value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Add Password',
                      hintStyle: ThemeTextStyle.loginTextFieldStyle,
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : _login, // Disable button while loading
                    child: isLoading
                        ? const CircularProgressIndicator() // Show loader when loading
                        : const Text('Login'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch("https://twitter.com/");
                        },
                        child: SocialMediaButton.twitter(
                          color: Colors.blue,
                          size: 20,
                          url: "https://twitter.com/",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("https://www.linkedin.com/");
                        },
                        child: SocialMediaButton.linkedin(
                          size: 20,
                          url: "https://www.linkedin.com/",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
