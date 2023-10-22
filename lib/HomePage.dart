import 'package:channab_fram_flutter/widgets/CustomeAppbar.dart';
import 'package:channab_fram_flutter/widgets/Finanace/SummaryAndTransactionWidget.dart';
import 'package:channab_fram_flutter/widgets/Finanace/Transaction.dart';
import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'api/homepage/timeFilter.dart';
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
  List<Transaction> transactions = [];
  List<Map<String, dynamic>> incomeSummary = [];
  List<Map<String, dynamic>> expenseSummary = [];

  @override
  void initState() {
    super.initState();
    fetchHomeData();
  }

  fetchHomeData() async {
    final data = await _apiService.getHomeData(widget.token, _selectedTimeFilter!);
    if (data != null) {
      // print("API Response: $data");
      List<dynamic> animalData = data['animals'];
      List<Animal> fetchedAnimals = animalData.map((a) => Animal.fromJson(a)).toList();

      List<dynamic> transactionData = data['transactions'] ?? [];
      List<Transaction> fetchedTransactions = transactionData.map((t) => Transaction.fromJson(t)).toList();

      setState(() {
        homeData = data;
        animals = fetchedAnimals;
        transactions = fetchedTransactions;
        incomeSummary = List<Map<String, dynamic>>.from(data['summary'] ?? []);
        expenseSummary = List<Map<String, dynamic>>.from(data['expense_summary'] ?? []);
      });
    } else {
      print("Error fetching home data.");
    }
  }

  void _onTimeFilterChanged(String? newFilter) {
    print("Time filter changed to: $newFilter");
    if (_selectedTimeFilter != newFilter) {
      setState(() {
        _selectedTimeFilter = newFilter;
      });

      // Fetch new data when the time filter changes
      fetchHomeData();
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
                  TimeFilter(
                    initialValue: _selectedTimeFilter,
                    onChanged: _onTimeFilterChanged,
                  ),
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
                    DashboardBox(title: "Total Expense", value: "\$${homeData?['total_expense'] ?? 'Loading...'}", percentageChange: "-20%", isSuccess: false),
                    DashboardBox(title: "Total Milk", value: "\$${homeData?['total_milk_today'] ?? 'Loading...'}", percentageChange: "+20%", isSuccess: true),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SummaryAndTransactionWidget(
                incomeSummary: incomeSummary,
                expenseSummary: expenseSummary,

              ),
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
            // Animal List Cards (Commented out as the widget is not provided)
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     children: animals.map((animal) {
            //       return AnimalListCard(animal: animal);
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
