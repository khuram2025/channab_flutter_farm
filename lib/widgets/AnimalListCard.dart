import 'package:flutter/material.dart';
import '../model/homeData.dart';

class AnimalListCard extends StatelessWidget {
  final Animal animal;
  final String serverBaseUrl = 'http://farmapp.channab.com'; // Replace with your actual server URL
  final String placeholderImagePath = 'assets/path_to_default_image.png'; // Replace with your actual placeholder image path

  AnimalListCard({required this.animal});

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
    String sexInfo = animal.sex == 'male' ? 'Male' : 'Female';
    String statusInfo = animal.status == 'active' ? 'Active' : 'Inactive';
    String milkProdInfo = animal.animalType == 'milking' ? 'Milk-Prod' : 'Non-Milk-Prod';

    String imageUrl = animal.image != null ? '$serverBaseUrl${animal.image}' : placeholderImagePath;

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
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Failed to load image from $imageUrl');
                        return Image.asset(placeholderImagePath, fit: BoxFit.cover);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(animal.tag, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(animal.age, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monitor_weight_outlined, size: 12, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text('${animal.purchaseCost} Kg', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            _infoBox(sexInfo, Colors.green),
                            _infoBox(statusInfo, Colors.green),
                            _infoBox(milkProdInfo, Colors.green),
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
