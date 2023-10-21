import 'package:channab_fram_flutter/widgets/CustomeAppbar.dart';
import 'package:channab_fram_flutter/widgets/AnimalListCard.dart';
import 'package:channab_fram_flutter/widgets/CustomeDrawer.dart';
import 'package:flutter/material.dart';

import 'AnimalDetailPage.dart';

class AnimalListPage extends StatefulWidget {
  final String token;

  AnimalListPage({required this.token});

  @override
  _AnimalListPageState createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(token: widget.token),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimalDetailPage()),
                );
              },
              child: AnimalListCard(
                imagePath: 'path_to_your_image', // Replace with your image path
                title: "Animal ${index + 1}",
                age: "${3 + index} Years",
                weight: "${200 + index * 10} Kg",
              ),
            );
          },
        ),
      ),
    );
  }
}
