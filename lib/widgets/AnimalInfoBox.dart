import 'package:flutter/material.dart';

class AnimalInfoBox extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color color;

  AnimalInfoBox({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      padding: EdgeInsets.all(12.0), // Reduced padding for less height
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: color),
          ),
          SizedBox(height: 6), // Reduced spacing for less height
          Row(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
              ),
              SizedBox(width: 8),
              Text(
                percentage,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
