import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prac2/components/cart_model.dart';
import 'package:prac2/market/ItemDetails.dart';
import 'package:prac2/market/itemsell.dart';
import 'package:prac2/market/market.dart';
import 'package:prac2/market/market_cart.dart';
import 'package:prac2/pages/NavBar.dart';
import 'package:prac2/pages/cartItem.dart';
import 'package:prac2/pages/forgot.dart';
import 'package:prac2/pages/home.dart';
import 'package:prac2/pages/login.dart';
import 'package:prac2/pages/profile.dart';
import 'package:prac2/pages/search.dart';
import 'package:prac2/pages/seller.dart';
import 'package:prac2/pages/settings.dart';
import 'package:prac2/pages/signup.dart';
import 'package:prac2/pages/startNew.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
      routes: {
        'register': (context) => MyRegister(),
        'forget': (context) => MyForget(),
        'login': (context) => MyLogin(),
        'home': (context) => MyHome(),
        'nav': (context) => NavBar(),
        'search': (context) => Search(),
        'profile': (context) => MyProfile(),
        'seller': (context) => Seller(),
        'market': (context) => Market(),
        'market_cart': (context) => MarketCart(),
        'settings': (context) => Settings(),
        '/MarketItemDetails': (context) => ItemMarket(),
        'itemsell': (context) => itemsell(),
        'backtomarket': (context) => Market(),
        'start': (context) => StartNew(),
        'insideshop': (context) => insideShop()
      },
    );
  }
}
