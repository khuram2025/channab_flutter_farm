import 'package:flutter/material.dart';

class EmployeeListCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String joinDate;
  final String jobTitle;
  final String balance;

  EmployeeListCard({
    required this.imagePath,
    required this.name,
    required this.joinDate,
    required this.jobTitle,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        width: double.infinity,
        height: 120,
        constraints: BoxConstraints(maxWidth: 500),
        child: Stack(
          children: [
            Row(
              children: [
                AspectRatio(
                  aspectRatio: 100 / 120, // width/height
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    ),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text("Joined: $joinDate", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work_outline, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(jobTitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.account_balance_wallet_outlined, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text("Balance: $balance", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: Colors.green, size: 16),
                  SizedBox(width: 4),
                  Icon(Icons.delete, color: Colors.red, size: 16), // Changed to red for delete icon
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
