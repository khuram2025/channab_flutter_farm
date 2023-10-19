import 'package:flutter/material.dart';

class SalaryTransactionTab extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final int amount;
  final int deductions;
  final int netSalary;
  final String processedBy;

  SalaryTransactionTab({
    required this.title,
    required this.description,
    required this.date,
    required this.amount,
    required this.deductions,
    required this.netSalary,
    this.processedBy = "HR",
  });

  @override
  _SalaryTransactionTabState createState() => _SalaryTransactionTabState();
}

class _SalaryTransactionTabState extends State<SalaryTransactionTab> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color lineColor = widget.amount < 0 ? Colors.red : Colors.green;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  height: 60,
                  color: lineColor,
                  margin: EdgeInsets.only(right: 12.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text(
                        widget.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Rs. ${widget.amount.toString()}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: lineColor),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            if (_isExpanded) ...[
              SizedBox(height: 10),
              Text("Deductions: Rs. ${widget.deductions}", style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 10),
              Text("Net Salary: Rs. ${widget.netSalary}", style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Processed by ${widget.processedBy}", style: TextStyle(color: Colors.grey[700])),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () {
                      // Handle edit
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Handle delete
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
