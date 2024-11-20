import 'package:flutter/material.dart';

class GECSubjectRegistrationPage extends StatelessWidget {
  final bool isRegistrationOpen = false; // Set to true if registration is open

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GEC Subject Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GEC Subject Registration',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              isRegistrationOpen
                  ? 'The GEC registration is currently open. Please complete your registration before the deadline.'
                  : 'The GEC registration is currently closed. Please check back during the next registration period.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            if (!isRegistrationOpen)
              Row(
                children: [
                  Icon(Icons.schedule, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded( // Wrap Text in Expanded to prevent overflow
                    child: Text(
                      'Next registration period: Jan 10 - Jan 20, 2025',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                      overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                    ),
                  ),
                ],
              ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 10),
            Text(
              'Timeline',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.grey),
                    title: Text('Previous GEC Registration: August 10 - August 20, 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time, color: isRegistrationOpen ? Colors.green : Colors.red),
                    title: Text(isRegistrationOpen
                        ? 'Current GEC Registration: Open until January 20, 2025'
                        : 'Upcoming GEC Registration: January 10 - January 20, 2025'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}