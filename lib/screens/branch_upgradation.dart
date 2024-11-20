import 'package:flutter/material.dart';

class BranchUpgradation extends StatefulWidget {
  const BranchUpgradation({super.key});

  @override
  State<BranchUpgradation> createState() => _BranchUpgradationState();
}

class _BranchUpgradationState extends State<BranchUpgradation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Branch Up-gradation"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("Registration Closed\n"
    "Note: Branch Upgradation: Allowed only for B.Tech 3rd Semester Students."),
      ),
    );
  }
}
