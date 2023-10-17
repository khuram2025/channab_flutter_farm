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
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: TextStyle(color: color)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 500),
        child: Row(
          children: [
            Image.asset(imagePath, width: 130, height: 250, fit: BoxFit.cover),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 24)),
                    Text("Age: $age"),
                    Text("Weight: $weight"),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Padding(
              padding: EdgeInsets.only(top: 8, right: 8),
              child: Column(
                children: [
                  Icon(Icons.edit, color: Colors.green),
                  Icon(Icons.delete, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
