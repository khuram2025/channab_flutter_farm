import 'package:flutter/material.dart';

class EmployeeOverviewTab extends StatelessWidget {
  final String name;
  final String joinDate;
  final String jobTitle;
  final String salaryBalance;
  final String basicSalary;
  final String salaryAllowance;
  final String totalSalary;

  EmployeeOverviewTab({
    required this.name,
    required this.joinDate,
    required this.jobTitle,
    required this.salaryBalance,
    required this.basicSalary,
    required this.salaryAllowance,
    required this.totalSalary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the overall background to white
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to start
        children: [
          SizedBox(height: 20),
          _buildRow("Name", name, 0),
          _buildRow("Join Date", joinDate, 1),
          _buildRow("Job Title", jobTitle, 2),
          _buildRow("Salary Balance", salaryBalance, 3),
          _buildRow("Basic Salary", basicSalary, 4),
          _buildRow("Salary Allowance", salaryAllowance, 5),
          _buildRow("Total Salary", totalSalary, 6),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, int index) {
    return Container(
      color: index.isEven ? Colors.grey[100] : Colors.white, // Alternate row colors
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
