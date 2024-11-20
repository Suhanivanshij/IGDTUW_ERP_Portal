import 'package:flutter/material.dart';

class MyEventsDetailPage extends StatelessWidget {
  const MyEventsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Events Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.orange[100],
              child: const Text(
                'Event Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            // Sample event data
            DataTable(
              columns: const [
                DataColumn(label: Text('Event Name')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Location')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Tech Fest')),
                  DataCell(Text('22-Nov-2024')),
                  DataCell(Text('Main Auditorium')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Cultural Day')),
                  DataCell(Text('15-Dec-2024')),
                  DataCell(Text('Campus Grounds')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}