import 'package:flutter/material.dart';
import 'package:prac2/components/cart_model.dart';
import 'package:provider/provider.dart';

class itemsTile extends StatefulWidget {
  String itemName;
  String itemPrice;
  String itemImage;
  Color color;
  int index;

  itemsTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemImage,
      required this.color,
      required this.index});

  @override
  State<itemsTile> createState() => _itemsTileState();
}

class _itemsTileState extends State<itemsTile> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // item image

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                widget.itemImage,
                height: 64,
              ),
            ),

            // item name
            Column(
              children: [
                Text(
                  widget.itemName,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$' + widget.itemPrice,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Icon(Icons.remove),
                  onTap: () {
                    setState(() {
                      if (value < 1) {
                        value = 0;
                      } else {
                        value--;
                      }
                    });

                    Provider.of<CartModel>(context, listen: false)
                        .RemoveItemFromCart(widget.index);
                  },
                ),
                Text(value.toString()),
                InkWell(
                    child: Icon(Icons.add),
                    onTap: () {
                      setState(() {
                        value++;
                      });
                      Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(widget.index);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
