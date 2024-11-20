import 'package:flutter/material.dart';

class ReMidRequestPage extends StatefulWidget {
  @override
  _ReMidRequestPageState createState() => _ReMidRequestPageState();
}

class _ReMidRequestPageState extends State<ReMidRequestPage> {
  final _formKey = GlobalKey<FormState>();

  // Dropdown values
  String selectedSemester = 'Semester 1';
  final List<String> semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];

  // Form fields
  String subjectName = '';
  String subjectCode = '';
  String requestDate = '';
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request for Re-Mid Paper')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Re-Mid Paper Request',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Semester Dropdown
              DropdownButtonFormField<String>(
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
                decoration: InputDecoration(
                  labelText: 'Select Semester',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Subject Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Subject Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    subjectName = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the subject name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Subject Code Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Subject Code',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    subjectCode = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the subject code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Request Date Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Requested On (DD/MM/YYYY)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    requestDate = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the request date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Status Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    status = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the status';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form submission logic can be added here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Request Submitted')),
                      );
                    }
                  },
                  child: Text('Submit Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}