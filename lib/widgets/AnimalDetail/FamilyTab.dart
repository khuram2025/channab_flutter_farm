import 'package:flutter/material.dart';
import '../AnimalListCard.dart';
import '../TextBoxGreen.dart';


class FamilyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _relationSection("Mother"),
            SizedBox(height: 10),
            // AnimalListCard(
            //   imagePath: 'path_to_your_image',
            //   title: "Mother Name",
            //   age: "5 Years",
            //   weight: "200 Kg",
            // ),
            SizedBox(height: 20),
            _relationSection("Father"),
            SizedBox(height: 10),
            // AnimalListCard(
            //   imagePath: 'path_to_your_image',
            //   title: "Father Name",
            //   age: "6 Years",
            //   weight: "220 Kg",
            // ),
            SizedBox(height: 20),
            _relationSection("Childs"),
            SizedBox(height: 10),
            // AnimalListCard(
            //   imagePath: 'path_to_your_image',
            //   title: "Child 1",
            //   age: "1 Year",
            //   weight: "50 Kg",
            // ),
            SizedBox(height: 10),
            // AnimalListCard(
            //   imagePath: 'path_to_your_image',
            //   title: "Child 2",
            //   age: "2 Years",
            //   weight: "60 Kg",
            // ),
          ],
        ),
      ),
    );
  }

  Widget _relationSection(String relation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(relation, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        CustomButton(
          buttonText: "Add Relation",
          onTap: () {
            // Handle button tap
          },
        )

      ],
    );
  }


}
