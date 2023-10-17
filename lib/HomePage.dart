import 'package:channab_fram_flutter/widgets/CustomeAppbar.dart';
import 'package:flutter/material.dart';
import 'widgets/AnimalInfoBox.dart';
import 'widgets/AnimalListCard.dart';
import 'widgets/CustomeDrawer.dart';
import 'widgets/CustomeDropdownButton.dart';
import 'widgets/DashboardBox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedTimeFilter = "This Month";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          // 1st Row
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Farm Name", style: TextStyle(fontSize: 24)),
                CustomDropdown(
                  initialValue: "This Month",
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                )

              ],
            ),
          ),
          // Dashboard
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardBox(title: "Total Income", value: "\$1000", percentageChange: "+20%", isSuccess: true),

                  DashboardBox(title: "Total Expense", value: "\$1000", percentageChange: "+20%", isSuccess: true),

                  DashboardBox(title: "Total Milk", value: "\$1000", percentageChange: "+20%", isSuccess: true)

                ],
              ),
            )


          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AnimalInfoBox(title: "All Animals", value: "50", percentage: "", color: Colors.blue),
                  AnimalInfoBox(title: "Milking", value: "10", percentage: "20%", color: Colors.green),
                  AnimalInfoBox(title: "Dry", value: "10", percentage: "30%", color: Colors.red),
                  AnimalInfoBox(title: "Calf", value: "20", percentage: "20%", color: Colors.purple),
                  AnimalInfoBox(title: "Other", value: "10", percentage: "40%", color: Colors.orange),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: List.generate(10, (index) {
                return AnimalListCard(
                  imagePath: 'path_to_your_image', // Replace with your image path
                  title: "Animal ${index + 1}",
                  age: "${3 + index} Years",
                  weight: "${200 + index * 10} Kg",
                );
              }),
            ),
          ),

        ],
      ),
    );
  }
}
