import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          // Open side menu
          Scaffold.of(context).openDrawer();
        },
      ),

      title: null, // Remove the title here
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(right: 140.0), // Reserve space for notification and profile icons
        child: Row(
          children: [
            SizedBox(width: 60), // Roughly the width of the menu button
            Text("Channab", style: TextStyle(color: Colors.black)),
            SizedBox(width: 10), // Some spacing after the title
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                // Handle notifications
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text("3", style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              // Replace with your image
              backgroundImage: AssetImage('path_to_your_image'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green, // green for online
              ),
            ),
          ],
        ),
        SizedBox(width: 10) // For some spacing on the right
      ],
    );
  }
}
