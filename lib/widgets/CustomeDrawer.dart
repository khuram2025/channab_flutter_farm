import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
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
                // Handle Dashboard tap
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Animals List'),
              onTap: () {
                // Handle Animals List tap
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Finance'),
              onTap: () {
                // Handle Finance tap
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('HR'),
              onTap: () {
                // Handle HR tap
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
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle Logout tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
