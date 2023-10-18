import 'package:flutter/material.dart';

import '../CustomeDropdownButton.dart';
import '../TextBoxGreen.dart';


class MilkingTab extends StatefulWidget {
  @override
  _MilkingTabState createState() => _MilkingTabState();
}

class _MilkingTabState extends State<MilkingTab> {
  List<Map<String, dynamic>> milkData = [
    {'date': '2022-10-01', 'first': 50, 'second': 300, 'third': 500, 'total': 5000},
    // Add more data as required
  ];
  int sortColumnIndex = 0;
  bool sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  buttonText: "Add Milking",
                  onTap: () {
                    // Handle button tap
                  },
                ),

                CustomDropdown(initialValue: "This Month",),

              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortAscending: sortAscending,
              sortColumnIndex: sortColumnIndex,
              columns: [
                DataColumn(label: Text('Date'), onSort: (columnIndex, ascending) {
                  setState(() {
                    sortAscending = ascending;
                    sortColumnIndex = columnIndex;
                    milkData.sort((a, b) => a['date'].compareTo(b['date']));
                    if (!ascending) milkData = milkData.reversed.toList();
                  });
                }),
                DataColumn(label: Text('1st')),
                DataColumn(label: Text('2nd')),
                DataColumn(label: Text('3rd')),
                DataColumn(label: Text('Total')),
              ],
              rows: milkData.map((entry) {
                return DataRow(cells: [
                  DataCell(Text(entry['date'])),
                  DataCell(Text(entry['first'].toString())),
                  DataCell(Text(entry['second'].toString())),
                  DataCell(Text(entry['third'].toString())),
                  DataCell(Text(entry['total'].toString())),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
