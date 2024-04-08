import 'package:flutter/material.dart';

class AccountMenuPage extends StatelessWidget {
  final String userName;
  final String userEmail;

  const AccountMenuPage(
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
        title: const Text('Account'),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                      radius: 40,
                    ),
                  ],
                ),
                const SizedBox(
                    width:
                        8), // Add spacing between the CircleAvatar and Text widget
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $userName',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userEmail,
                      style: const TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                    const Text(
                      '+63 912 345 6789',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 99, 98, 98)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.help_outline,
                              size: 20, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'FAQs',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline,
                              size: 20, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'About CBOO Portal',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_phone, size: 20, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined,
                              size: 20, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Rate our app',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.settings, size: 20, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                // Navigate to the '/' route
                Navigator.pushNamed(context, '/');
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout, size: 20, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 99, 98, 98),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,
                            size: 20, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            'V 1.0.0',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Developed By',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image.asset('assets/Icon-192.png',
                              width: 20, height: 20),
                          const SizedBox(width: 4),
                          const Text(
                            'CBOO',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 99, 98, 98),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
