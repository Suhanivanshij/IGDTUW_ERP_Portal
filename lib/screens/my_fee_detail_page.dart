import 'package:flutter/material.dart';

class MyFeeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fee Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.green[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Fee Detail', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('Click here to view and pay dues'),
                    ],
                  ),
                  Text('137500/-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: [
                DataColumn(label: Text('S. No.')),
                DataColumn(label: Text('Academic Session')),
                DataColumn(label: Text('Semester')),
                DataColumn(label: Text('Head Name')),
                DataColumn(label: Text('Due Amount')),
                DataColumn(label: Text('Action')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('2024-2025')),
                  DataCell(Text('Odd')),
                  DataCell(Text('Annual Fees B.Tech')),
                  DataCell(Text('137500.0')),
                  DataCell(
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Pay Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Note: Please ensure your Bank Transfer Limit is sufficient to Pay the fee. Contact your home branch to expand the limit.',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}