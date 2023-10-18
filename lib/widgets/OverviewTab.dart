import 'package:flutter/material.dart';

class OverviewTab extends StatelessWidget {
  final String title;
  final String tag;
  final String age;
  final String weight;
  final String category;
  final String sex;

  OverviewTab({
    required this.title,
    required this.tag,
    required this.age,
    required this.weight,
    required this.category,
    required this.sex,
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
          _buildRow("Tag", tag, 0),
          _buildRow("Age", age, 1),
          _buildRow("Weight", weight, 2),
          _buildRow("Category", category, 3),
          _buildRow("Sex", sex, 4),
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
