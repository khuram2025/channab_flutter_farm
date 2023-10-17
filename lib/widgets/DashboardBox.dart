import 'package:flutter/material.dart';

class DashboardBox extends StatelessWidget {
  final String title;
  final String value;
  final String percentageChange;
  final bool isSuccess;

  DashboardBox({
    required this.title,
    required this.value,
    required this.percentageChange,
    this.isSuccess = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              percentageChange,
              style: TextStyle(
                fontSize: 14,
                color: isSuccess ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
