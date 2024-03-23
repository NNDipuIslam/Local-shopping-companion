import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac2/components/itemList.dart';
import 'package:prac2/pages/NavBar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prac2/pages/order.dart';
import 'package:prac2/components/cart_model.dart';
import 'package:provider/provider.dart';

class insideShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                },
              ),
            );
          },
          child: const Icon(Icons.shopping_bag),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemBuilder: (context, index) {
                  return itemsTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    itemImage: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    index: index,
                  );
                },
              );
            }))
          ],
        ),
      ),
    );
  }
}
