import 'package:flutter/material.dart';

class ProfilePageRoute extends StatelessWidget {
  const ProfilePageRoute({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Payroll History',
          ),
        ],
        currentIndex: 0, // Set the current index to indicate the selected tab
        selectedItemColor: Theme.of(context)
            .primaryColor, // Set the color for the selected tab item
        onTap: (int index) {
          // Handle navigation to different tabs here
        },
      ),
    );
  }
}
