import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfilePage(
      {super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to previous screen
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Personal Information'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.home_rounded),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.png'),
                    radius: 40,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Change Photo',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 90, 155),
                        ),
                      ),
                      Icon(Icons.edit_square,
                          size: 10, color: Color.fromARGB(255, 10, 90, 155)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        userName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        userEmail,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 99, 98, 98)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Date of birth',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'December 25, 2000',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 99, 98, 98),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey, // Adjust the color of the divider as needed
              thickness: 0.2, // Adjust the thickness of the divider as needed
              height: 20, // Adjust the height of the divider as needed
              indent:
                  0, // Adjust the indent (left padding) of the divider as needed
              endIndent:
                  16, // Adjust the endIndent (right padding) of the divider as needed
            ),
            const SizedBox(height: 16.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Citizenship',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Filipino',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 99, 98, 98),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey, // Adjust the color of the divider as needed
              thickness: 0.2, // Adjust the thickness of the divider as needed
              height: 20, // Adjust the height of the divider as needed
              indent:
                  0, // Adjust the indent (left padding) of the divider as needed
              endIndent:
                  16, // Adjust the endIndent (right padding) of the divider as needed
            ),
            const SizedBox(height: 16.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '+63 912 345 6789',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 99, 98, 98),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey, // Adjust the color of the divider as needed
              thickness: 0.2, // Adjust the thickness of the divider as needed
              height: 20, // Adjust the height of the divider as needed
              indent:
                  0, // Adjust the indent (left padding) of the divider as needed
              endIndent:
                  16, // Adjust the endIndent (right padding) of the divider as needed
            ),
            const SizedBox(height: 16.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Current Address',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Your Address, Baguio City, Philippines, 2600',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 99, 98, 98),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey, // Adjust the color of the divider as needed
              thickness: 0.2, // Adjust the thickness of the divider as needed
              height: 20, // Adjust the height of the divider as needed
              indent:
                  0, // Adjust the indent (left padding) of the divider as needed
              endIndent:
                  16, // Adjust the endIndent (right padding) of the divider as needed
            ),
            const SizedBox(height: 16.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Digital Signature',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Not Set',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 99, 98, 98),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey, // Adjust the color of the divider as needed
              thickness: 0.2, // Adjust the thickness of the divider as needed
              height: 20, // Adjust the height of the divider as needed
              indent:
                  0, // Adjust the indent (left padding) of the divider as needed
              endIndent:
                  16, // Adjust the endIndent (right padding) of the divider as needed
            ),
          ],
        ),
      ),
    );
  }
}
