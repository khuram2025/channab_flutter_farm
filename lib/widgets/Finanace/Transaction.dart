import 'package:flutter/material.dart';

class TransactionWidget extends StatefulWidget {
  final String title;
  final String description;
  final int amount;
  final String addedBy;
  final String time;

  TransactionWidget({
    required this.title,
    required this.description,
    required this.amount,
    this.addedBy = "Admin",
    required this.time,
  });

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
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
                  child: Text(widget.title,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                ),
                Text(
                  "Rs. ${widget.amount.toString()}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: lineColor),
                ),
              ],
            ),
            if (_isExpanded) ...[
              SizedBox(height: 10),
              Text(widget.description, style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Added by ${widget.addedBy}", style: TextStyle(color: Colors.grey[700])),
                  Spacer(),
                  Text(widget.time, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              Row(
                children: [
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
