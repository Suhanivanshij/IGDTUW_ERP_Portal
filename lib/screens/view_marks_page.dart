import 'package:flutter/material.dart';

class ViewMarksPage extends StatefulWidget {
  @override
  _ViewMarksPageState createState() => _ViewMarksPageState();
}

class _ViewMarksPageState extends State<ViewMarksPage> {
  String selectedSemester = '1'; // Default semester
  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> marksData = [
    {
      'S. No.': '1',
      'Exam Type': 'Regular',
      'Subject Code': 'BCS 201',
      'Subject': 'Data Structures',
      'Semester': '3',
      'Comp 1': 'ETIP (Yet to submit)',
      'Comp 2': 'MTET (Yet to submit)',
      'Comp 3': 'CAP (Yet to submit)',
      'Comp 4': 'ETET (Yet to submit)',
      'Comp 5': '--'
    },
    {
      'S. No.': '2',
      'Exam Type': 'Regular',
      'Subject Code': 'BIT 201',
      'Subject': 'Database Management Systems',
      'Semester': '3',
      'Comp 1': 'ETIP (Yet to submit)',
      'Comp 2': 'MTET (Yet to submit)',
      'Comp 3': 'CAP (Yet to submit)',
      'Comp 4': 'ETET (Yet to submit)',
      'Comp 5': '--'
    },
    // Add more data similarly
  ];

  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = marksData; // Initial data load
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredData = marksData
            .where((item) => item.values.any(
                (value) => value.toLowerCase().contains(query.toLowerCase())))
            .toList();
      });
    } else {
      setState(() {
        filteredData = marksData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Marks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
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
                Spacer(),
                // Search bar
                Container(
                  width: 200,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: filterSearchResults,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      filteredData = marksData;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, // Allows vertical scrolling
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Allows horizontal scrolling
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('S. No.')),
                        DataColumn(label: Text('Exam Type')),
                        DataColumn(label: Text('Subject Code')),
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('Semester')),
                        DataColumn(label: Text('Comp 1')),
                        DataColumn(label: Text('Comp 2')),
                        DataColumn(label: Text('Comp 3')),
                        DataColumn(label: Text('Comp 4')),
                        DataColumn(label: Text('Comp 5')),
                      ],
                      rows: filteredData.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data['S. No.'] ?? '')),
                          DataCell(Text(data['Exam Type'] ?? '')),
                          DataCell(Text(data['Subject Code'] ?? '')),
                          DataCell(Text(data['Subject'] ?? '')),
                          DataCell(Text(data['Semester'] ?? '')),
                          DataCell(Text(data['Comp 1'] ?? '')),
                          DataCell(Text(data['Comp 2'] ?? '')),
                          DataCell(Text(data['Comp 3'] ?? '')),
                          DataCell(Text(data['Comp 4'] ?? '')),
                          DataCell(Text(data['Comp 5'] ?? '')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}