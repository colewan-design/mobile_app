import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cboo_mobile_app/user/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:cboo_mobile_app/user/nav_bar.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String token;

  const MyHomePage({super.key, required this.title, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon on the top left
            Image.asset('assets/Icon-192.png', width: 40, height: 40),

            // Philippine flag on the top right
            Image.asset('assets/flag.png', width: 40, height: 40),
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to grey
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Second Row: Left side avatar icon with "Hi", account name, and mobile number. Right Side BSU logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: Avatar icon, "Hi", account name, and mobile number
                FutureBuilder<UserData>(
                  future:
                      _fetchUserData(), // Call the method to fetch user data
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final userData = snapshot.data!;
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds:
                                          300), // Adjust the duration as needed
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(1.0,
                                            0.0), // Start position (right side of the screen)
                                        end: Offset
                                            .zero, // End position (center of the screen)
                                      ).animate(animation),
                                      child: ProfilePage(
                                        userName: userData.name,
                                        userEmail: userData.email,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/avatar.png'),
                                  radius: 20,
                                ),
                                const SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hi, ${userData.name}',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.blue)),
                                    const Text('+63 991 123 4321',
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),

                // Right side: BSU logo
                Image.asset('assets/bagongPilipinas.png',
                    width: 80, height: 80),
              ],
            ),

            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/time-management.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'DTR',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/credit.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'PAY',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/sunbed.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'LEAVE',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/report-card.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'REPORT',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/error.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'NOTICE',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/responsibility.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'BENEFITS',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/tax.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'TAX',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularCard(
                      Image.asset('assets/gradient/edit.png'),
                      Colors.teal.shade50,
                      30.0, // Adjust the icon size as needed
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'PR',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16.0), // Adding space between rows

            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      32, // Adjust width as needed
                  child: const CardExample(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 4, 54, 95),
          elevation: 0,
          onPressed: () => debugPrint("Add Button pressed"),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 3, color: const Color.fromARGB(255, 4, 54, 95)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.settings_input_antenna,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: FutureBuilder<UserData>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavBar(
              pageIndex: 0,
              onTap: (index) {},
              userData:
                  snapshot.data!, // Pass the fetched user data to the NavBar
            );
          } else {
            return const SizedBox(); // If data is not yet available, show an empty container
          }
        },
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

  Widget _buildCircularCard(Widget iconWidget, Color color, double iconSize) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: iconWidget,
        ),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/wallet.png', width: 40, height: 40),
              title: const Text('Your Payslip has been updated'),
              subtitle:
                  const Text('Click this card to visit the payslip page.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('View'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Download'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
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
