import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prac2/components/cart_model.dart';
import 'package:prac2/pages/market/ItemDetails.dart';
import 'package:prac2/pages/market/itemsell.dart';
import 'package:prac2/pages/market/market.dart';
import 'package:prac2/pages/market/market_cart.dart';
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
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;
  Widget initialRoute = user != null ? MyHome() : MyLogin();

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  final Widget initialRoute;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: initialRoute,
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
            'itemsell': (context) => itemSell(),
            'backtomarket': (context) => Market(),
            'start': (context) => StartNew(),
          },
        ));
  }
}
