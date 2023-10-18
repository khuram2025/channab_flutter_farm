import 'package:flutter/material.dart';

import '../widgets/CustomeAppbar.dart';
import '../widgets/CustomeDrawer.dart';
import '../widgets/Finanace/Transaction.dart';
import '../widgets/Finanace/finBox.dart';

class FinanceHome extends StatefulWidget {
  @override
  _FinanceHomeState createState() => _FinanceHomeState();
}

class _FinanceHomeState extends State<FinanceHome> {
  String? _selectedFilter = "This Month";

  // Sample transactions for demo purposes
  final List<Map<String, dynamic>> _transactions = [
    {
      "title": "Bought Feed",
      "description": "Purchased feed for the cattle from ABC store.",
      "amount": -500,
      "addedBy": "Admin",
      "time": "10:30 AM",
    },
    {
      "title": "Milk Sale",
      "description": "Sold milk to XYZ Dairy.",
      "amount": 1500,
      "addedBy": "Admin",
      "time": "1:00 PM",
    },
    // Add more transactions as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          // Finance boxes
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FinanceBox(
                  text: "Income",
                  amount: 5000,
                  percentage: 10,
                  color: Colors.green,
                ),
                FinanceBox(
                  text: "Expense",
                  amount: 5000,
                  percentage: -10,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
          // Transaction History title and filter dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction History", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedFilter,
                  items: <String>["This Month", "Last Month", "This Year"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFilter = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          // Transactions list
          Expanded(
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                return _buildTransaction(_transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransaction(Map<String, dynamic> transaction) {
    return TransactionWidget(
      title: transaction["title"],
      description: transaction["description"],
      amount: transaction["amount"],
      addedBy: transaction["addedBy"],
      time: transaction["time"],
    );
  }
}
