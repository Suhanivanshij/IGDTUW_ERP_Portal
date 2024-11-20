import 'package:flutter/material.dart';
import '../widgets/dashboard_tile.dart';
import '../constants/colors.dart';
import '../widgets/drawer_menu.dart';

class ERPDashboard extends StatelessWidget {
  const ERPDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERP Dashboard'),
      ),
      drawer: DrawerMenu(),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          // Fee Detail Tile
          const DashboardTile(
            title: 'My Fee Detail',
            value: '₹137500',
            color: AppColors.accent,
            icon: Icons.attach_money,
            routeName: '/feeDetail',
          ),

          // Notices Tile
          const DashboardTile(
            title: 'Notices',
            value: '10 new',
            color: AppColors.primaryBlue,
            icon: Icons.notifications,
            routeName: '/notices',
          ),

          // My Events Tile
          const DashboardTile(
            title: 'My Events',
            value: '2 Upcoming',
            color: AppColors.primaryGreen,
            icon: Icons.event,
            routeName: '/myEvents',
          ),

          // Timetable Tile
          const DashboardTile(
            title: 'Timetable',
            value: 'View Timetable',
            color: AppColors.primaryOrange,
            icon: Icons.calendar_today,
            routeName: '/timetable',
          ),

          // // My Profile Tile
          // const DashboardTile(
          //   title: 'My Profile',
          //   value: 'View Details',
          //   color: AppColors.primaryGreen,
          //   icon: Icons.person,
          //   routeName: '/myProfile',
          // ),

          // Feedback Tile
          // const DashboardTile(
          //   title: 'Feedback',
          //   value: 'Provide Feedback',
          //   color: AppColors.accent,
          //   icon: Icons.feedback,
          //   routeName: '/feedback',
          // ),
        ],
      ),
    );
  }
}