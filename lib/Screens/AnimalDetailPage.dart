import 'package:flutter/material.dart';

import '../widgets/AnimalDetail/FamilyTab.dart';
import '../widgets/AnimalDetail/HealthTab.dart';
import '../widgets/AnimalDetail/MilkingTab.dart';
import '../widgets/AnimalDetail/WeightTab.dart';
import '../widgets/OverviewTab.dart';

class AnimalDetailPage extends StatefulWidget {
  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _tabs = [
    {"title": "Overview", "icon": Icons.dashboard},
    {"title": "Family", "icon": Icons.family_restroom},
    {"title": "Milking", "icon": Icons.local_drink},
    {"title": "Health", "icon": Icons.local_hospital},
    {"title": "Weight", "icon": Icons.line_weight},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animal Detail")),
      body: Column(
        children: [
          // Animal Image
          Image.asset(
            'path_to_image', // Replace with your image path
            width: MediaQuery.of(context).size.width,
            height: 300,
            fit: BoxFit.cover,
          ),

          // Animal Title and Icons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Animal Title",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.notifications_none, color: Colors.green),
                    SizedBox(width: 10),
                    Icon(Icons.edit_outlined, color: Colors.green),
                    SizedBox(width: 10),
                    Icon(Icons.delete_outline, color: Colors.green),
                  ],
                ),
              ],
            ),
          ),

          // Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _tabs.map((tab) {
                int index = _tabs.indexOf(tab);
                bool isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: isSelected
                        ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.green, width: 2),
                      ),
                    )
                        : null,
                    child: Column(
                      children: [
                        Icon(tab['icon'], color: isSelected ? Colors.green : Colors.grey),
                        SizedBox(height: 4),
                        Text(
                          tab['title'],
                          style: TextStyle(
                            color: isSelected ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Tab Content
          Expanded(
            child: _buildSelectedTabContent(),
          ),


        ],
      ),
    );
  }
  Widget _buildSelectedTabContent() {
    switch (_selectedIndex) {
      case 0:
        return OverviewTab(
          title: "Overview",
          tag: "Animal Tag",
          age: "Animal Age",
          weight: "Current Weight",
          category: "Animal Category",
          sex: "Animal Sex",
        );
      case 1:
        return FamilyTab();
      case 2:
        return MilkingTab();
      case 3:
        return HealthTab();
      case 4:
        return WeightTab();
      default:
        return Center(
          child: Text(_tabs[_selectedIndex]['title'], style: TextStyle(fontSize: 24)),
        );
    }
  }
}

