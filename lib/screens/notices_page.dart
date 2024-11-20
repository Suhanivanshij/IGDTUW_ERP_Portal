import 'package:flutter/material.dart';

class NoticesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('S. No.')),
                DataColumn(label: Text('Title')),
                DataColumn(label: Text('Document')),
                DataColumn(label: Text('Date Of Uploading')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Office Order')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.file_copy),
                      onPressed: () {},
                    ),
                  ),
                  DataCell(Text('22-07-2021')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}