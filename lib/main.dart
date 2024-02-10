import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac2/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:prac2/firebase_options.dart';
import 'package:prac2/market/ItemDetails.dart';
import 'package:prac2/market/market_cart.dart';
import 'package:prac2/pages/NavBar.dart';
import 'package:prac2/pages/cart.dart';
import 'package:prac2/pages/cartItem.dart';
import 'package:prac2/pages/forgot.dart';
import 'package:prac2/pages/home.dart';
import 'package:prac2/pages/login.dart';
import 'package:prac2/market/market.dart';
import 'package:prac2/pages/profile.dart';
import 'package:prac2/pages/search.dart';
import 'package:prac2/pages/seller.dart';
import 'package:prac2/pages/settings.dart';
import 'package:prac2/pages/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyLogin(),
        routes: {
          'register': (context) => MyRegister(),
          'forget': (context) => MyForget(),
          'login': (context) => MyLogin(),
          'home': (context) => MyHome(),
          'cart': (context) => MyCart(),
          'shop': (context) => shopname(),
          'nav': (context) => navBar(),
          'search': (context) => search(),
          'profile': (context) => MyProfile(),
          'seller': (context) => Seller(),
          'market': (context) => Market(),
          'market_cart': (context) => Market_cart(),
          'settings': (context) => Settings(),
          '/MarketItemDetails': (context) => itemMarket()
        },
      ),
    );
  }
}
