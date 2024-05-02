import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac2/bloc/bloc/account_bloc.dart';
import 'package:prac2/components/MyShop.dart';
import 'package:prac2/components/AllList.dart';
import 'package:prac2/pages/NavBar.dart';
import 'package:prac2/pages/cartItem.dart';
import 'package:prac2/pages/order.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final AccountBloc accountBloc = AccountBloc();
  @override
  void initState() {
    accountBloc.add(BusinessInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: appbar(context),
        body: BlocConsumer<AccountBloc, AccountState>(
          bloc: accountBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case BusinessFetchLoadingState:
                return Scaffold(
                    body: Center(
                  child: CircularProgressIndicator(),
                ));
              case BusinessFetchErrorState:
                break;

              case BusinessFetchSuccessState:
                final successState = state as BusinessFetchSuccessState;
                print(successState.posts.toString());
                return Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          "All Shops",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1, childAspectRatio: 1.6),
                              itemCount: successState.posts.length,
                              itemBuilder: (context, int index) {
                                print(successState.posts[index].id);
                                return MyShop(
                                  shopName: successState.posts[index].shopName,
                                  address:
                                      successState.posts[index].shopLocation,
                                  ImagePath: successState.posts[index].imageUrl,
                                  star: successState.posts[index].phoneNumber,
                                  Id: successState.posts[index].id,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ));

              default:
            }
            return Container();
          },
        ));
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "search");
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_cart))
      ],
    );
  }
}

Widget FRow(BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    IconButton(
      color: const Color.fromARGB(255, 0, 0, 0),
      onPressed: () {
        Navigator.pushNamed(context, 'cart');
      },
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
    ),
  ]);
}

Widget search(BuildContext context) {
  return Expanded(
    child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      )
    ])),
  );
}
