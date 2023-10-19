import 'package:flutter/material.dart';

import '../TextBoxGreen.dart'; // Assuming you have this import for the CustomButton

class SalaryComponentTab extends StatefulWidget {
  @override
  _SalaryComponentTabState createState() => _SalaryComponentTabState();
}

class _SalaryComponentTabState extends State<SalaryComponentTab> {
  int? _expandedEntryIndex;

  final List<Map<String, dynamic>> _entries = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CustomButton(
                buttonText: "Add Component",
                onTap: () {
                  // Handle button tap
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _entries.length,
            itemBuilder: (BuildContext context, int index) {
              bool isExpanded = _expandedEntryIndex == index;
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        _entries[index]["title"].length > 20 && !isExpanded ? _entries[index]["title"].substring(0, 20) + "..." : _entries[index]["title"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_entries[index]["amount"]),
                      onTap: () {
                        setState(() {
                          if (isExpanded) {
                            _expandedEntryIndex = null;
                          } else {
                            _expandedEntryIndex = index;
                          }
                        });
                      },
                    ),
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description: ${_entries[index]["description"]}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
