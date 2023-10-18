import 'package:flutter/material.dart';
import '../TextBoxGreen.dart';

class WeightTab extends StatefulWidget {
  @override
  _WeightTabState createState() => _WeightTabState();
}

class _WeightTabState extends State<WeightTab> {
  int? _expandedEntryIndex;
  String? _selectedFilter = "This Month";

  final List<Map<String, dynamic>> _weightEntries = [
    {
      "date": "2023-10-10",
      "weight": "60kg",
      "change": "+2kg",
      "totalWeight": "60kg",
      "weightChange": "+2kg",
      "weightChangePercentage": "3.4%",
      "weightGainPerDay": "0.2kg",
      "description": "Routine weight checkup and the animal is healthy.",
    },
    // ... Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              buttonText: "Add Weight",
              onTap: () {
                // Handle button tap
              },
            ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Weight", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Change", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Actions", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _weightEntries.length,
            itemBuilder: (BuildContext context, int index) {
              bool isExpanded = _expandedEntryIndex == index;
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_weightEntries[index]["date"]),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_weightEntries[index]["weight"]),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_weightEntries[index]["change"]),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: isExpanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
                                onPressed: () {
                                  setState(() {
                                    if (isExpanded) {
                                      _expandedEntryIndex = null;
                                    } else {
                                      _expandedEntryIndex = index;
                                    }
                                  });
                                },
                              ),
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
                        ),
                      ],
                    ),
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Weight: ${_weightEntries[index]["weight"]}"),
                            Text("Change: ${_weightEntries[index]["change"]}"),
                            Text("Total Weight: ${_weightEntries[index]["totalWeight"]}"),
                            Text("Weight Change: ${_weightEntries[index]["weightChange"]}"),
                            Text("Weight Change Percentage: ${_weightEntries[index]["weightChangePercentage"]}"),
                            Text("Weight Gain Per Day: ${_weightEntries[index]["weightGainPerDay"]}"),
                            Text("Description: ${_weightEntries[index]["description"]}"),
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
