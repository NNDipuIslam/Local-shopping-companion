// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac2/bloc/bloc/account_bloc.dart';
import 'package:provider/provider.dart';

import 'package:prac2/components/cart_model.dart';
import 'package:prac2/components/itemList.dart';
import 'package:prac2/pages/NavBar.dart';
import 'package:prac2/pages/order.dart';

class insideShop extends StatefulWidget {
  final int id;
  const insideShop({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<insideShop> createState() => _insideShopState();
}

class _insideShopState extends State<insideShop> {
  AccountBloc accountBloc = AccountBloc();
  @override
  void initState() {
    accountBloc.add(ItemInitialFetchEvent());
    super.initState();
  }

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
            body: BlocConsumer<AccountBloc, AccountState>(
              bloc: accountBloc,
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ItemFetchLoadingState:
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case ItemFetchErrorState:
                    break;
                  case ItemFetchSuccessState:
                    final successState = state as ItemFetchSuccessState;
                    final items = successState.posts
                        .where((item) => item.shopId == widget.id)
                        .toList();
                    return Column(children: [
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
                      items.isNotEmpty
                          ? Expanded(child: Consumer<CartModel>(
                              builder: (context, value, child) {
                              return GridView.builder(
                                padding: const EdgeInsets.all(12),
                                itemCount: items.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.2,
                                ),
                                itemBuilder: (context, index) {
                                  return GroceryItemTile(
                                    itemName: items[index].itemName,
                                    itemPrice: items[index].itemPrice,
                                    imagePath: items[index].imageUrl,
                                    id: items[index].shopId,
                                  );
                                },
                              );
                            }))
                          : Container(
                              alignment: Alignment.center,
                              child: Text(
                                'No items available for this shop.',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                    ]);
                }
                return Container();
              },
            )));
  }
}
