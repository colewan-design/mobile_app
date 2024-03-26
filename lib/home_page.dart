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
        children: [
          _buildCard(
            context: context,
            icon: Icons.attach_money,
            title: 'Payslips',
            onTap: () {
              // Handle onTap for payslips card
            },
          ),
          const SizedBox(height: 16.0),
          _buildCard(
            context: context,
            icon: Icons.history,
            title: 'History',
            onTap: () {
              // Handle onTap for history card
            },
          ),
          const SizedBox(height: 16.0),
          _buildCard(
            context: context,
            icon: Icons.bug_report,
            title: 'Bugs',
            onTap: () {
              // Handle onTap for bugs card
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text(
                  'CBOO Admin',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                accountEmail: Text(
                  'sample@email.com',
                  style: TextStyle(color: Colors.black87),
                ),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
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
                    builder: (context) => const ProfilePage(
                      userName: 'CBOO Admin',
                      userEmail: 'sample@email.com',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.black87),
              ),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context, // Accept BuildContext as a parameter
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color:
                    Theme.of(context).primaryColor, // Use the provided context
              ),
              const SizedBox(width: 16.0),
              Text(
                title,
                style: const TextStyle(fontSize: 18.0),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
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
