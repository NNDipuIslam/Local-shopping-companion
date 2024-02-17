import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("N N Dipu Islam"),
              accountEmail: Text("Sagor Sarker"),
              decoration: BoxDecoration(color: Colors.pink)),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "profile");
            },
            leading: Icon(Icons.face),
            title: Text(
              "My Profile",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "profile");
            },
            leading: Icon(Icons.list),
            title: Text(
              "Current Orders",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "start");
            },
            leading: Icon(Icons.sell),
            title: Text(
              "Start new business",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "market");
            },
            leading: Icon(Icons.house),
            title: Text(
              "Market Place",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 150),
          ListTile(
              leading: Icon(Icons.share),
              title: Text(
                "Share",
                style: TextStyle(fontSize: 18),
              )),
          ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "settings");
              },
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18),
              )),
          ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: AlertDialog(
                          title: Text("Are you sure to log out?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "login", (route) => false);
                                  ;
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("NO"))
                          ],
                        ),
                      );
                    });
              },
              leading: Icon(Icons.logout),
              title: Text(
                "signout",
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
    );
  }
}
