import 'package:flutter/material.dart';

import '../widgets/Employee/EmployeeOverviewTab.dart';
import '../widgets/Employee/SalaryTransactionTab.dart';

// Remember to import or create the relevant widgets for the tabs.
// For now, I'm using placeholders.

class EmployeeDetailPage extends StatefulWidget {
  @override
  _EmployeeDetailPageState createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _tabs = [
    {"title": "Overview", "icon": Icons.dashboard},
    {"title": "Salary Transaction", "icon": Icons.attach_money},
    {"title": "Salary Components", "icon": Icons.assignment},
    {"title": "Tasks", "icon": Icons.work},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Detail")),
      body: Column(
        children: [
          // Employee Image
          Image.asset(
            'path_to_employee_image', // Replace with your image path
            width: MediaQuery.of(context).size.width,
            height: 300,
            fit: BoxFit.cover,
          ),

          // Employee Title and Icons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Employee Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.notifications_none, color: Colors.blue),
                    SizedBox(width: 10),
                    Icon(Icons.edit_outlined, color: Colors.blue),
                    SizedBox(width: 10),
                    Icon(Icons.delete_outline, color: Colors.blue),
                  ],
                ),
              ],
            ),
          ),

          // Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _tabs.map((tab) {
                int index = _tabs.indexOf(tab);
                bool isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: isSelected
                        ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 2),
                      ),
                    )
                        : null,
                    child: Column(
                      children: [
                        Icon(tab['icon'], color: isSelected ? Colors.blue : Colors.grey),
                        SizedBox(height: 4),
                        Text(
                          tab['title'],
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Tab Content
          Expanded(
            child: _buildSelectedTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedTabContent() {
    switch (_selectedIndex) {
      case 0:
        return EmployeeOverviewTab(
          name: 'John Doe',
          jobTitle: 'Software Developer',
          basicSalary: 'Rs. 50,000',
          salaryAllowance: 'Rs. 10,000',
          totalSalary: 'Rs. 60,000',
          joinDate: '5th January 2020',
          salaryBalance: 'Rs. 15,000',
        ); // Placeholder for OverviewTab
      case 1:
        return SingleChildScrollView(
          child: Column(
            children: [
              SalaryTransactionTab(
                title: "January Salary",
                date: "01-01-2023",
                amount: 50000,
                deductions: 5000,
                netSalary: 45000,
                processedBy: "John Doe",
                description: 'This is description for the salery',
              ),
              SalaryTransactionTab(
                title: "February Salary",
                date: "01-02-2023",
                amount: 51000,
                deductions: 5500,
                netSalary: 45500,
                processedBy: "Jane Smith",
                description: 'This is description for the salery',
              ),
              SalaryTransactionTab(
                title: "March Salary",
                date: "01-03-2023",
                amount: 52000,
                deductions: 6000,
                netSalary: 46000,
                processedBy: "John Doe",
                description: 'This is description for the salery',
              ),
            ],
          ),
        ); // Placeholder for SalaryTransactionTab
      case 2:
        return SingleChildScrollView(
          child: Column(
            children: [
              SalaryTransactionTab(
                title: "January Salary",
                date: "01-01-2023",
                amount: 50000,
                deductions: 5000,
                netSalary: 45000,
                processedBy: "John Doe",
                description: 'This is description for the salry component',
              ),
              SalaryTransactionTab(
                title: "February Salary",
                date: "01-02-2023",
                amount: 51000,
                deductions: 5500,
                netSalary: 45500,
                processedBy: "Jane Smith",
                description: 'This is description for the salry component',
              ),
              SalaryTransactionTab(
                title: "March Salary",
                date: "01-03-2023",
                amount: 52000,
                deductions: 6000,
                netSalary: 46000,
                processedBy: "John Doe",
                description: 'This is description for the salry component',
              ),
              SalaryTransactionTab(
                title: "January Salary",
                date: "01-01-2023",
                amount: 50000,
                deductions: 5000,
                netSalary: 45000,
                processedBy: "John Doe",
                description: 'This is description for the salry component',
              ),
              SalaryTransactionTab(
                title: "February Salary",
                date: "01-02-2023",
                amount: 51000,
                deductions: 5500,
                netSalary: 45500,
                processedBy: "Jane Smith",
                description: 'This is description for the salry component',
              ),
              SalaryTransactionTab(
                title: "March Salary",
                date: "01-03-2023",
                amount: 52000,
                deductions: 6000,
                netSalary: 46000,
                processedBy: "John Doe",
                description: 'This is description for the salry component',
              ),
            ],
          ),
        );
    // Placeholder for SalaryComponentsTab
      // case 3:
      //   return TasksTab(); // Placeholder for TasksTab
      default:
        return Center(
          child: Text(_tabs[_selectedIndex]['title'], style: TextStyle(fontSize: 24)),
        );
    }
  }
}
