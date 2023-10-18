import 'package:flutter/material.dart';

import '../TextBoxGreen.dart';

class HealthTab extends StatefulWidget {
  @override
  _HealthTabState createState() => _HealthTabState();
}

class _HealthTabState extends State<HealthTab> {
  int? _expandedEntryIndex;

  final List<Map<String, dynamic>> _entries = [
    {
      "date": "2023-10-10",
      "title": "Routine Checkup",
      "description": "This is a detailed description for the routine checkup.",
      "price": "\$50",
      "medicine": "Medicine A",
    },
    {
      "date": "2023-09-25",
      "title": "Vaccination",
      "description": "This is a detailed description for the vaccination.",
      "price": "\$20",
      "medicine": "Medicine B",
    },
    //... Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CustomButton(
                buttonText: "Add Health",
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
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _entries[index]["title"].length > 20
                                  ? _entries[index]["title"].substring(0, 20) + "..."
                                  : _entries[index]["title"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(_entries[index]["date"]),
                        ],
                      ),
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
                            Text("Price: ${_entries[index]["price"]}"),
                            Text("Medicine: ${_entries[index]["medicine"]}"),
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
