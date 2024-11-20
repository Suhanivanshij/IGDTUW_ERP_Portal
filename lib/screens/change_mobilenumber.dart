import 'package:flutter/material.dart';

class ChangePhoneNumberPage extends StatefulWidget {
  @override
  ChangePhoneNumberPageState createState() => ChangePhoneNumberPageState();
}

class ChangePhoneNumberPageState extends State<ChangePhoneNumberPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _studentMobileController = TextEditingController();
  final TextEditingController _newStudentMobileController = TextEditingController();
  final TextEditingController _parentMobileController = TextEditingController();
  final TextEditingController _newParentMobileController = TextEditingController();
  final TextEditingController _parentEmailController = TextEditingController();
  final TextEditingController _newParentEmailController = TextEditingController();

  void _resetFields() {
    _studentMobileController.clear();
    _newStudentMobileController.clear();
    _parentMobileController.clear();
    _newParentMobileController.clear();
    _parentEmailController.clear();
    _newParentEmailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Student Mobile Number Field
              TextFormField(
                controller: _studentMobileController,
                decoration: InputDecoration(
                  labelText: 'Student Mobile Number',
                  hintText: 'Enter current mobile number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student\'s current mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // New Student Mobile Number Field
              TextFormField(
                controller: _newStudentMobileController,
                decoration: InputDecoration(
                  labelText: 'New Student Mobile Number',
                  hintText: 'Enter new mobile number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student\'s new mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Parent Mobile Number Field
              TextFormField(
                controller: _parentMobileController,
                decoration: InputDecoration(
                  labelText: 'Parent Mobile Number',
                  hintText: 'Enter current parent mobile number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the current parent mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // New Parent Mobile Number Field
              TextFormField(
                controller: _newParentMobileController,
                decoration: InputDecoration(
                  labelText: 'New Parent Mobile Number',
                  hintText: 'Enter new parent mobile number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the new parent mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Parent Email Field
              TextFormField(
                controller: _parentEmailController,
                decoration: InputDecoration(
                  labelText: 'Parent Email',
                  hintText: 'Enter current parent email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the current parent email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // New Parent Email Field
              TextFormField(
                controller: _newParentEmailController,
                decoration: InputDecoration(
                  labelText: 'New Parent Email',
                  hintText: 'Enter new parent email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the new parent email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Submit and Reset Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process contact details change here
                      }
                    },
                    icon: Icon(Icons.check),
                    label: Text('Submit'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: _resetFields,
                    icon: Icon(Icons.refresh),
                    label: Text('Reset'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}