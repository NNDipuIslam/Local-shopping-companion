import 'package:flutter/material.dart';

class CartModel1 extends ChangeNotifier {
  final List _shopName = [
    ["Abdul Market", "Santosh,Tangail Sadar", "lib/images/st5.jpeg", "20"],
    [
      "Sattar Market",
      "Santikunjo Mor,Tangail Sadar",
      "lib/images/st2.jpeg",
      "30"
    ],
    ["LakeView Market", "Porabari,Tangail Sadar", "lib/images/st3.jpeg", "10"],
    ["Nirala Market", "Nirala,Tangail Sadar", "lib/images/st4.jpeg", "9"],
  ];
  final List _itemName = [
    ["Lentil", "100", "lib/images/lentil.jpg", "12"],
  ];

  final List _marketItem = [
    ["Lentils", "100tk", "lib/images/lentil.jpg", "1", "2"],
    ["Rice", "70tk", "lib/images/rice.jpg", "3", "4"],
    ["Green Chilies", "50tk", "lib/images/greenchili.jpg", "5", "6"],
    ["Soyabin Oil", "800tk", "lib/images/oil.jpg", "7", "8"],
    ["Basmati rice", "250tk", "lib/images/Basmati-Rice.jpg", "hello", "hi"],
    ["Kalai Dal", "280tk", "lib/images/kalai.jpg", "kalai", "dal"],
    ["Flour", "40tk", "lib/images/flour.jpg", "Flour", "Courier"],
    ["Onion", "100tk", "lib/images/onion.jpg", "Onion", "By courier"],
  ];

  get ShopName => _shopName;
  get ItemName => _itemName;
  get MarketItem => _marketItem;
  List _cartItems = [];

  get cartItems => _cartItems;

// add item to cart
  void addItemToCart(int index) {
    print(12);
    _cartItems.add(_itemName[index]);

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
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
