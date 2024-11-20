import 'package:flutter/material.dart';

class SemesterRegestration extends StatefulWidget {
  const SemesterRegestration({super.key});

  @override
  State<SemesterRegestration> createState() => _SemesterRegestrationState();
}

class _SemesterRegestrationState extends State<SemesterRegestration> {
  String selectedSemester = '3'; // Default semester
  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> subjectdata= [
    {
      'S.No.':'1',
      'Subject Code/Subject name':'BCS 201(Data Structures)',
      'Status':'Submitted',
    },
    {
      'S.No.':'2',
      'Subject Code/Subject name':'BAI 205(Neural Networks And Artificial Intelligence)',
      'Status':'Submitted',
    },
    {
      'S.No.':'3',
      'Subject Code/Subject name':'BEC 205(Network Analysis And Synthesis)',
      'Status':'Submitted',
    },
    {
      'S.No.':'4',
      'Subject Code/Subject name':'BIT 201(Database Management System)',
      'Status':'Submitted',
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
        title: Text('Semester Registration'),
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
                      filteredData = subjectdata;
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
                        DataColumn(label: Text('Subject Code/Subject Name')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: filteredData.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data['S.No.'] ?? '')),
                          DataCell(Text(data['Subject Code/Subject name'] ?? '')),
                          DataCell(Text(data['Status'] ?? '')),
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


