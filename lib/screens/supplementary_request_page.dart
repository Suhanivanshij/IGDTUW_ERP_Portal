import 'package:flutter/material.dart';

class SupplementaryRequestPage extends StatefulWidget {
  @override
  _SupplementaryRequestPageState createState() => _SupplementaryRequestPageState();
}

class _SupplementaryRequestPageState extends State<SupplementaryRequestPage> {
  final _formKey = GlobalKey<FormState>();

  // Dropdown values
  String selectedSemester = 'Semester 1';
  String selectedSubject = 'Subject 1';
  final List<String> semesters = ['Semester 1', 'Semester 2', 'Semester 3', 'Semester 4'];
  final Map<String, double> subjectFees = {
    'Subject 1': 500.0,
    'Subject 2': 700.0,
    'Subject 3': 600.0,
  };

  // Form fields
  String subjectCode = '';
  String requestDate = '';
  String status = '';
  String internalMarks = '';

  double amountToBePaid = 0.0;
  double amountAlreadyPaid = 0.0;

  // Function to calculate amount to be paid based on selected subject
  void _calculateAmount() {
    setState(() {
      amountToBePaid = subjectFees[selectedSubject] ?? 0.0;
      amountAlreadyPaid = 0.0; // Reset or fetch from backend if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request for Supplementary Exam')),
      body: SingleChildScrollView(  // Added to enable scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Supplementary Exam Request',
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

                // Subject Dropdown
                DropdownButtonFormField<String>(
                  value: selectedSubject,
                  items: subjectFees.keys.map((String subject) {
                    return DropdownMenuItem<String>(
                      value: subject,
                      child: Text(subject),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedSubject = newValue!;
                      _calculateAmount(); // Recalculate amount based on selected subject
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Subject',
                    border: OutlineInputBorder(),
                  ),
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

                // Internal Marks Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Internal Marks',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      internalMarks = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the internal marks';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Amount Fields
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount to be Paid',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  controller: TextEditingController(
                    text: amountToBePaid.toStringAsFixed(2),
                  ),
                ),
                SizedBox(height: 20),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount Already Paid',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  controller: TextEditingController(
                    text: amountAlreadyPaid.toStringAsFixed(2),
                  ),
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
                          SnackBar(content: Text('Supplementary Exam Request Submitted')),
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
      ),
    );
  }
}