import 'package:channab_fram_flutter/widgets/CustomeAppbar.dart';
import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'model/homeData.dart';
import 'widgets/AnimalInfoBox.dart';
import 'widgets/AnimalListCard.dart';
import 'widgets/CustomeDrawer.dart';
import 'widgets/CustomeDropdownButton.dart';
import 'widgets/DashboardBox.dart';

class HomePage extends StatefulWidget {
  final String token;

  HomePage({required this.token});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedTimeFilter = "This Month";
  Map<String, dynamic>? homeData;
  final ApiService _apiService = ApiService();

  List<Animal> animals = [];

  @override
  void initState() {
    super.initState();
    fetchHomeData();
  }

  fetchHomeData() async {
    final data = await _apiService.getHomeData(widget.token, _selectedTimeFilter!);
    if (data != null) {
      List<dynamic> animalData = data['animals'];
      List<Animal> fetchedAnimals = animalData.map((a) => Animal.fromJson(a)).toList();
      setState(() {
        homeData = data;
        animals = fetchedAnimals;
      });
    } else {
      print("Error fetching home data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(token: widget.token),
      body: SingleChildScrollView(
        child: Column(
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
                    DashboardBox(title: "Total Income", value: "\$${homeData?['total_income'] ?? 'Loading...'}", percentageChange: "+20%", isSuccess: true),

                    DashboardBox(title: "Total Expense", value: "\$${homeData?['total_expense'] ?? 'Loading...'}", percentageChange: "+20%", isSuccess: true),

                    DashboardBox(title: "Total Milk", value: "\$${homeData?['total_milk_today'] ?? 'Loading...'}", percentageChange: "+20%", isSuccess: true)

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
                children: animals.map((animal) {
                  return AnimalListCard(animal: animal);
                }).toList(),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
