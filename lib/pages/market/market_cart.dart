import 'package:flutter/material.dart';

class MarketCart extends StatefulWidget {
  const MarketCart({super.key});

  @override
  State<MarketCart> createState() => _MarketCartState();
}

class _MarketCartState extends State<MarketCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market_Cart"),
      ),
    );
  }
}
