import 'package:flutter/material.dart';

class PayslipsPage extends StatelessWidget {
  const PayslipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payslips'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example: Assuming there are 10 payslips
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Payslip ${index + 1}'),
            subtitle: Text(
                'Date: ${DateTime.now().subtract(Duration(days: index)).toString().split(' ')[0]}'), // Example: Using current date as payslip date
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {
                    // View payslip
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {
                    // Download payslip as PDF
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
