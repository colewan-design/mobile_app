import 'dart:convert';
import 'package:cboo_mobile_app/home_page.dart';
import 'package:cboo_mobile_app/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cboo_mobile_app/user/profile_page.dart'; // Assuming this is where ProfilePage is imported from

class CustomDrawer extends StatelessWidget {
  final String token;

  const CustomDrawer({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<UserData>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return Center(child: Text('No user data available'));
          } else {
            final userData = snapshot.data!;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                  ),
                  accountEmail: Text(userData.email),
                  accountName: Text(
                    userData.name,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  decoration: const BoxDecoration(
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
                          userName: userData.name,
                          userEmail: userData.email,
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
}
