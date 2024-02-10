import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.pink,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "search");
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "cart");
            },
            icon: Icon(Icons.shopping_cart))
      ],
    ));
  }
}
