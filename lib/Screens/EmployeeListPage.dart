import 'package:channab_fram_flutter/Screens/EmployeeDetailPage.dart';
import 'package:channab_fram_flutter/widgets/CustomeAppbar.dart';

import 'package:channab_fram_flutter/widgets/CustomeDrawer.dart';
import 'package:flutter/material.dart';

import '../widgets/HR/EmployeeCard.dart';


class EmployeeListPage extends StatefulWidget {
  final String token;

  EmployeeListPage({required this.token});
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
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
                  MaterialPageRoute(builder: (context) => EmployeeDetailPage()), // This will navigate to the EmployeeDetailPage
                );
              },
              child: EmployeeListCard(
                imagePath: 'path_to_your_employee_image', // Replace with your employee image path
                name: "Employee ${index + 1}",
                joinDate: "2022-10-${10 + index}",
                jobTitle: "Title ${index + 1}",
                balance: "${2000 + index * 100} \$",
              ),
            );
          },
        ),
      ),
    );
  }
}
