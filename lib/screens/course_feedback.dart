import 'package:flutter/material.dart';

class CourseFeedback extends StatefulWidget {
  const CourseFeedback({super.key});

  @override
  State<CourseFeedback> createState() => _CourseFeedbackState();
}

class _CourseFeedbackState extends State<CourseFeedback> {
  String record = '10'; // Default semester
  final List<String> records = ['10', '15', '25', '50', '100', 'All'];
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> data= [
    {
      'S.No.':'1',
      'Survey name':'Faculty Feedback (New)',
      'Created By':'ACADEMICS ADMIN',
      'Publish Date':'22-Apr-2024',
      'Close Date':'31-May-2024',
      'Action':'Submitted',
      'Survey Status':'CLOSE'
    },
    {
      'S.No.':'',
      'Survey name':'Search Survey Name',
      'Created By':'Search Created By',
      'Publish Date':'Search Publish Date',
      'Close Date':'Search Close Date',
      'Action':'Search Action',
      'Survey Status':'Search Survey Status'
    }
  ];
  List<Map<String, String>> filteredData = [];

  @override

  void initState() {
    super.initState();
    filteredData = data; // Initial data load
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredData = data
            .where((item) => item.values.any(
                (value) => value.toLowerCase().contains(query.toLowerCase())))
            .toList();
      });
    } else {
      setState(() {
        filteredData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Faculty & Course Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Display\n records per page',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: record,
                  items: records.map((String semester) {
                    return DropdownMenuItem<String>(
                      value: semester,
                      child: Text(semester),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                    record = newValue!;
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
                      labelText: 'Filter',
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
                      filteredData = data;
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
                        DataColumn(label: Text('Survey name')),
                        DataColumn(label: Text('Created By')),
                        DataColumn(label: Text('Publish Date')),
                        DataColumn(label: Text('Close Date')),
                        DataColumn(label: Text('Action')),
                        DataColumn(label: Text('Survey Status')),
                      ],
                      rows: filteredData.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data['S.No.'] ?? '')),
                          DataCell(Text(data['Survey name'] ?? '')),
                          DataCell(Text(data['Created By'] ?? '')),
                          DataCell(Text(data['Publish Date'] ?? '')),
                          DataCell(Text(data['Close Date'] ?? '')),
                          DataCell(Text(data['Action'] ?? '')),
                          DataCell(Text(data['Survey Status'] ?? '')),
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
