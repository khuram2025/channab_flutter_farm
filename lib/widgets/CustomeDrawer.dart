import 'package:flutter/material.dart';

import '../HomePage.dart';
import '../Screens/AnimalList.dart';
import '../Screens/EmployeeListPage.dart';
import '../Screens/FinanaceHome.dart';
import '../Screens/LoginPage.dart';

class CustomDrawer extends StatelessWidget {
  final String token;
  CustomDrawer({required this.token});

  @override
  bool isUserLoggedIn = false;

  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                // Replace with your image
                backgroundImage: AssetImage('path_to_your_image'),
              ),
              accountName: Text('Username'),
              accountEmail: Text('Farm Name'),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(token: token)));
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Animals List'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimalListPage(token: token)));
              },
            ),

            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Finance'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FinanceHome(token: token)));
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('HR'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeListPage(token: token)));// Handle HR tap
              },
            ),
            ListTile(
              leading: Icon(Icons.nature),
              title: Text('My Farm'),
              onTap: () {
                // Handle My Farm tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings tap
              },
            ),
            ListTile(
        leading: Icon(isUserLoggedIn ? Icons.logout : Icons.login),
        title: Text(isUserLoggedIn ? 'Logout' : 'Login'),
        onTap: () {
          if (isUserLoggedIn) {
            // Handle Logout logic
            isUserLoggedIn = false;
          } else {
            // Navigate to Login Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
      ),
          ],
        ),
      ),
    );
  }
}
