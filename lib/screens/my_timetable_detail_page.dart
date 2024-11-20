import 'package:flutter/material.dart';

class MyTimetableDetailPage extends StatelessWidget {
  const MyTimetableDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Timetable Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blue[100],
              child: const Text(
                'Timetable Details Here',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            // Sample timetable data
            DataTable(
              columns: const [
                DataColumn(label: Text('Day')),
                DataColumn(label: Text('Subject')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Location')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Monday')),
                  DataCell(Text('Mathematics')),
                  DataCell(Text('10:00 AM - 11:00 AM')),
                  DataCell(Text('Room 101')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Tuesday')),
                  DataCell(Text('Physics')),
                  DataCell(Text('11:00 AM - 12:00 PM')),
                  DataCell(Text('Room 102')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}