import 'package:flutter/material.dart';

class AdmitCardPage extends StatefulWidget {
  @override
  _AdmitCardPageState createState() => _AdmitCardPageState();
}

class _AdmitCardPageState extends State<AdmitCardPage> {
  String selectedSession = 'Jul-Dec 2024';
  String selectedSemester = '1';
  bool isAdmitCardReleased = false; // Change to true to show admit card options
  final List<String> sessions = ['Jul-Dec 2024', 'Jan-Jun 2025', 'Jul-Dec 2025'];
  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admit Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling
              child: Row(
                children: [
                  Text(
                    'Exam Session',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedSession,
                    items: sessions.map((String session) {
                      return DropdownMenuItem<String>(
                        value: session,
                        child: Text(session),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedSession = newValue!;
                      });
                    },
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Semester',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedSemester,
                    items: semesters.map((String semester) {
                      return DropdownMenuItem<String>(
                        value: semester,
                        child: Text(semester),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedSemester = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            isAdmitCardReleased
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.grey[200],
                  child: Text(
                    'Admit Card for $selectedSession, Semester $selectedSemester',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling for buttons
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.visibility),
                        label: Text("View"),
                        onPressed: () {
                          // Logic to view admit card
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        icon: Icon(Icons.edit),
                        label: Text("Modify"),
                        onPressed: () {
                          // Logic to modify admit card details
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        icon: Icon(Icons.download),
                        label: Text("Download"),
                        onPressed: () {
                          // Logic to download admit card
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Container(
              padding: EdgeInsets.all(16),
              color: Colors.yellow[100],
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.orange),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Admit card will be available to download once released.",
                      style: TextStyle(fontSize: 16),
                    ),
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