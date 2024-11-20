import 'package:flutter/material.dart';
import '../screens/attendance_graph.dart';
import '../screens/attendance_report.dart';
import '../screens/branch_upgradation.dart';
import '../screens/course_feedback.dart';
import '../screens/erp_dashboard.dart';
import '../screens/semester_regestration.dart';
import '../screens/admit_card.dart';
import '../screens/change_mobilenumber.dart';
import '../screens/change_password.dart';
import '../screens/convocation_registration.dart';
import '../screens/gec_subject_registation.dart';
import '../screens/reappear_request_page.dart';
import '../screens/remid_request_page.dart';
import '../screens/student_profile_section.dart';
import '../screens/supplementary_request_page.dart';
import '../screens/view_marks_page.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Suhani Vanshij'),
            accountEmail: Text('vedanshi@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            leading: Icon(Icons.dashboard),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: const Text('Convocation'),
            leading: const Icon(Icons.school),
            children: <Widget>[
              ListTile(
                title: const Text('Convocation Registration'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConvocationRegistrationPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('My Profile'),
            leading: const Icon(Icons.person),
            children: <Widget>[
              ExpansionTile(
                title: const Text('Personal Information'),
                children: <Widget>[
                  ListTile(
                    title: const Text('Student Profile'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentProfilePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Change Password'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Change Mobile Number'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePhoneNumberPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          // New Exam Process Section
          ExpansionTile(
            title: const Text('Exam Process'),
            leading: const Icon(Icons.library_books),
            children: <Widget>[
              ExpansionTile(
                title: const Text('Post-Exam Activities'),
                children: <Widget>[
                  ListTile(
                    title: const Text('GEC Subject Registration'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GECSubjectRegistrationPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Request for Re-appear Paper'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReAppearRequestPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Request for Supplementary Paper'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupplementaryRequestPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Request for Re-Mid Paper'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReMidRequestPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('View Marks'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewMarksPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Exam Report'),
                children: <Widget>[
                  ListTile(
                    title: const Text('Admit Card'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdmitCardPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Degree Data Details'),
                children: <Widget>[
                  ListTile(
                    title: const Text('Update Degree Data Details'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Degree Data Details'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Academic Management'),
            children: <Widget>[
              ExpansionTile(
                title: const Text('Branch Up-gradation'),
                children: <Widget>[
                  ListTile(
                    title: const Text('Request For Branch Change'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BranchUpgradation(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Semester Registration'),
                children: <Widget>[
                  ListTile(
                    title: const Text('Student Semester Registration'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterRegestration(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Report'),
                children: <Widget>[
                  ListTile(
                    title: const Text('Attendance Report'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendanceReport(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Attendance Graph'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendanceGraph(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Student Alumni Feedback'),
            leading: const Icon(Icons.school),
            children: <Widget>[
              ListTile(
                title: const Text('Online Feedback'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseFeedback(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


