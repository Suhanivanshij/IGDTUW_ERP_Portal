import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final String routeName;

  // Add `key` as an optional named parameter
  const DashboardTile({
    Key? key, // This allows `key` to be passed when the widget is created
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.routeName,
  }) : super(key: key); // Pass `key` to the parent constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName); // Navigate using routeName
      },
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Text(value, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}