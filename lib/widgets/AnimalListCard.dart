import 'package:flutter/material.dart';

class AnimalListCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String age;
  final String weight;

  AnimalListCard({
    required this.imagePath,
    required this.title,
    required this.age,
    required this.weight,
  });

  Widget _infoBox(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        width: double.infinity,
        height: 120,
        constraints: BoxConstraints(maxWidth: 500),
        child: Stack(
          children: [
            Row(
              children: [
                AspectRatio(
                  aspectRatio: 100 / 120, // width/height
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    ),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(age, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monitor_weight_outlined, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(weight, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            _infoBox("Female", Colors.green),
                            _infoBox("Active", Colors.green),
                            _infoBox("Milk-Prod", Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: Colors.green, size: 16),
                  SizedBox(width: 4),
                  Icon(Icons.delete, color: Colors.green, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
