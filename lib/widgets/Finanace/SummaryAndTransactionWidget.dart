import 'package:flutter/material.dart';

class SummaryAndTransactionWidget extends StatelessWidget {
  final List<Map<String, dynamic>> incomeSummary;
  final List<Map<String, dynamic>> expenseSummary;

  SummaryAndTransactionWidget({
    required this.incomeSummary,
    required this.expenseSummary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Income Summary
        _buildSummaryCard('Income Summary', incomeSummary, Icons.arrow_downward, Colors.green),
        // Expense Summary
        _buildSummaryCard('Expense Summary', expenseSummary, Icons.arrow_upward, Colors.red),
      ],
    );
  }

  Widget _buildSummaryCard(
      String title,
      List<Map<String, dynamic>> summary,
      IconData icon,
      Color color,
      ) {
    return Card(
      color: Colors.white, // Set card background color to white

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            ...summary.map((entry) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: color.withOpacity(0.1),
                      child: Icon(icon, size: 20, color: color),
                    ),
                    title: Text(
                      entry['category'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      'Rs. ${entry['total_amount']}',
                      style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(height: 0.5, color: Colors.grey[300]),
                ],
              );
            }).toList(),
          ],
        ),
    );
  }
}
