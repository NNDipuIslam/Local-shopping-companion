import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac2/bloc/bloc/account_bloc.dart';
import 'package:prac2/pages/market/marketList.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  AccountBloc accountBloc = AccountBloc();
  @override
  void initState() {
    accountBloc.add(ProductInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Market Place")),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "market_cart");
                },
                child: Icon(Icons.shopping_cart),
              )
            ],
          ),
          body: BlocConsumer<AccountBloc, AccountState>(
            bloc: accountBloc,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case ProductFetchLoadingState:
                  return Scaffold(
                      body: Center(
                    child: CircularProgressIndicator(),
                  ));
                case ProductFetchErrorState:
                  break;
                case ProductFetchSuccessState:
                  final successState = state as ProductFetchSuccessState;
                  return Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [sell(context), search(context)],
                          ),
                          Divider(),
                          Text(
                            "Today's Picks",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.97, // Ratio of item width to item height, 1.0 for square items
                                ),
                                itemCount: successState.posts.length,
                                itemBuilder: (context, int index) {
                                  return MarketList(
                                    ItemName:
                                        successState.posts[index].itemName,
                                    Price: successState.posts[index].itemPrice,
                                    ImagePath:
                                        successState.posts[index].imageUrl,
                                    ProductInfo: successState
                                        .posts[index].productInformation,
                                    DeliveryInfo: successState
                                        .posts[index].deliveryInformation,
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
          )),
    );
  }
}

Widget FRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, "home");
        },
        child: Icon(Icons.arrow_back),
      ),
      Text(
        "Market Place",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, "market_cart");
        },
        child: Icon(Icons.shopping_cart),
      )
    ],
  );
}

Widget sell(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, "itemsell");
    },
    child: Container(
      height: 40,
      width: 180,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 230, 226, 226)),
      child: Row(
        children: [
          SizedBox(width: 30),
          Icon(Icons.edit_note),
          Text(
            "SELL",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    ),
  );
}

Widget search(BuildContext context) {
  return Container(
    height: 40,
    width: 180,
    child: TextField(
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 230, 226, 226),
          filled: true,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    ),
  );
}
