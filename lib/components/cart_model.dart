import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale

  // list of cart items
  get cartItems => _cartItems;

  // add item to cart
  List<Map<String, dynamic>> _cartItems = [];

  void addItemToCart(List<String> itemData) {
    // Extracting item data
    String itemName = itemData[0];
    String itemPrice = itemData[1];
    String imagePath = itemData[2];
    int quantity = int.parse(itemData[3]);
    int id = int.parse(itemData[4]);

    // Check if an item with the same name and id exists
    bool itemExists = false;
    for (Map<String, dynamic> item in _cartItems) {
      if (item['itemName'] == itemName && item['id'] == id) {
        // Update the quantity if the item exists
        item['quantity'] = quantity.toString(); // Convert to string
        itemExists = true;
        break;
      }
    }

    // If the item doesn't exist, add it to the list
    if (!itemExists) {
      Map<String, dynamic> newItem = {
        'itemName': itemName,
        'itemPrice': itemPrice,
        'imagePath': imagePath,
        'quantity': quantity.toString(), // Convert to string
        'id': id.toString(), // Convert to string
      };
      _cartItems.add(newItem);
    }

    // Notify listeners that the cart items have changed
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      String priceValue = _cartItems[i]
          ['itemPrice']; // Accessing 'itemPrice' instead of 'price'
      String quantityValue = _cartItems[i]['quantity'];
      double price = double.parse(priceValue);
      int quantity = int.parse(quantityValue);
      totalPrice += price * quantity;
    }
    return totalPrice.toStringAsFixed(2);
  }
}
