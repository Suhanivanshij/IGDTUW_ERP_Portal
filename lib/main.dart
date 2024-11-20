import 'package:flutter/material.dart';
import 'package:igdtuw_erp_protal/screens/attendance_graph.dart';
import 'package:igdtuw_erp_protal/screens/attendance_report.dart';
import 'package:igdtuw_erp_protal/screens/branch_upgradation.dart';
import 'package:igdtuw_erp_protal/screens/course_feedback.dart';
import 'package:igdtuw_erp_protal/screens/erp_dashboard.dart';
import 'package:igdtuw_erp_protal/screens/semester_regestration.dart';
import 'package:igdtuw_erp_protal/screens/my_fee_detail_page.dart';
import 'package:igdtuw_erp_protal/screens/notices_page.dart';
import 'package:igdtuw_erp_protal/screens/my_events_detail_page.dart';
import 'package:igdtuw_erp_protal/screens/my_timetable_detail_page.dart';
import 'package:igdtuw_erp_protal/screens/convocation_registration.dart';
import 'package:igdtuw_erp_protal/screens/student_profile_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ERPDashboard(),
        '/Branch Up-gradation': (context) => BranchUpgradation(),
        '/Semester Registration': (context) =>  SemesterRegestration(),
        '/attendance report': (context) => AttendanceReport(),
        '/attendance graph': (context) => AttendanceGraph(),
        '/Course feedback': (context) => CourseFeedback(),
        '/feeDetail': (context) => MyFeeDetailPage(),
        '/notices': (context) =>  NoticesPage(),
        '/myEvents': (context) =>  MyEventsDetailPage(),
        '/timetable': (context) =>  MyTimetableDetailPage(),
        '/myProfile': (context) =>  StudentProfilePage(),
        //'/feedback': (context) => const FeedbackPage(),
      },
    );
  }
}