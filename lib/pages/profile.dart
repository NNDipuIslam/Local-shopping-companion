import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              "Abdul Mia",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(
                  "4.5", // Replace with the user's rating
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileOptionButton(icon: Icons.edit, label: "Edit Profile"),
                ProfileOptionButton(icon: Icons.phone, label: "Call Now"),
                ProfileOptionButton(
                    icon: Icons.shopping_cart, label: "Show Items"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileOptionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // Add functionality for each option here
          },
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}