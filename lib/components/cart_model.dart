import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    [
      "Lentil",
      "200",
      "lib/images/lentil.jpg",
      Color.fromARGB(255, 125, 214, 128)
    ],
    [
      "Green Chili",
      "50",
      "lib/images/greenchili.jpg",
      Color.fromARGB(255, 228, 220, 152)
    ],
    [
      "Basmati Rice",
      "280",
      "lib/images/rice.jpg",
      Color.fromARGB(255, 161, 115, 97)
    ],
    [
      "Soyabin",
      "800",
      "lib/images/oil.jpg",
      Color.fromARGB(255, 112, 155, 190)
    ],
    [
      "Kalai Dal",
      "280",
      "lib/images/kalai.jpg",
      Color.fromARGB(255, 98, 101, 104)
    ],
    [
      "Onion",
      "100",
      "lib/images/onion.jpg",
      Color.fromARGB(255, 163, 144, 110)
    ],
  ];

  // list of cart items
  List _cartItems = [];
  List<List<dynamic>> uniqueValuesWithCounts = [];
  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void printList() {
    print(uniqueValuesWithCounts);
  }

  // remove item from cart
  void minusItemFromCart(int index, int value) {
    if (value > 0) {
      _cartItems.removeAt(index);
    } else
      _cartItems.clear();
    notifyListeners();
  }

  void RemoveItemFromCart(int index) {
    _cartItems.removeAt(index);

    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
