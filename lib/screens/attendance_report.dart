import 'package:flutter/material.dart';

class AttendanceReport extends StatefulWidget {
  const AttendanceReport({super.key});

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  List<Map<String, String>> subjectdata = [
    {
      'S.No.': '1',
      'Course': 'Programming With Python',
      'Course Code': 'BAI 110',
      'Teacher': 'Monika Mathur',
      'Lecture Conducted': '0',
      'Lecture Attended': '0',
      'Attendance % out of conducted': '0.00%',
    },
    {
      'S.No.': '2',
      'Course': 'Probability and statistics',
      'Course Code': 'BAS 108',
      'Teacher': 'Dr Bindu',
      'Lecture Conducted': '0',
      'Lecture Attended': '0',
      'Attendance % out of conducted': '0.00%',
    },
    {
      'S.No.': '3',
      'Course': 'IT Workshop',
      'Course Code': 'BAI 108',
      'Teacher': 'Mr Neeraj Kohli',
      'Lecture Conducted': '0',
      'Lecture Attended': '0',
      'Attendance % out of conducted': '0.00%',
    },
    // Add more data similarly
  ];
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = subjectdata; // Initial data load
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredData = subjectdata
            .where((item) => item.values.any(
                (value) => value.toLowerCase().contains(query.toLowerCase())))
            .toList();
      });
    } else {
      setState(() {
        filteredData = subjectdata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Report'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('S. No.')),
                    DataColumn(label: Text('Course')),
                    DataColumn(label: Text('Course Code')),
                    DataColumn(label: Text('Teacher')),
                    DataColumn(label: Text('Lecture Conducted')),
                    DataColumn(label: Text('Lecture Attended')),
                    DataColumn(label: Text('Attendance % out of conducted')),
                  ],
                  rows: filteredData.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data['S.No.'] ?? '')),
                      DataCell(Text(data['Course'] ?? '')),
                      DataCell(Text(data['Course Code'] ?? '')),
                      DataCell(Text(data['Teacher'] ?? '')),
                      DataCell(Text(data['Lecture Conducted'] ?? '')),
                      DataCell(Text(data['Lecture Attended'] ?? '')),
                      DataCell(Text(data['Attendance % out of conducted'] ?? '')),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

