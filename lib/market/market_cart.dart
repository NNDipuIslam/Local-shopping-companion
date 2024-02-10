import 'package:flutter/material.dart';

class Market_cart extends StatefulWidget {
  const Market_cart({super.key});

  @override
  State<Market_cart> createState() => _Market_cartState();
}

class _Market_cartState extends State<Market_cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market_Cart"),
      ),
    );
  }
}
