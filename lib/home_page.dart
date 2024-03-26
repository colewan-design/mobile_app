import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cboo_mobile_app/user/profile_page.dart';
import 'package:cboo_mobile_app/login_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String token;

  const MyHomePage({super.key, required this.title, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // Your card widgets here
        ],
      ),
      drawer: Drawer(
        child: FutureBuilder<UserData>(
          future: _fetchUserData(), // Call the method to fetch user data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final userData = snapshot.data!;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                    ),
                    accountEmail: Text(userData.email),
                    accountName: Text(
                      userData.name,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(
                      ' My Profile ',
                      style: TextStyle(color: Colors.black87),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            userName: userData.name, // Pass user name
                            userEmail: userData.email, // Pass user email
                          ),
                        ),
                      );
                    },
                  ),
                  // Other drawer items
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<UserData> _fetchUserData() async {
    const url = 'http://192.168.110.72/api/user';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body)['data'];
      return UserData.fromJson(userData);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  void _logout(BuildContext context) {
    // Implement logout logic here
    // For example, clear token, navigate back to login page, etc.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;

  UserData({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
