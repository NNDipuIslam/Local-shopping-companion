import 'package:flutter/material.dart';
import 'package:prac2/market/marketList.dart';
import 'package:prac2/components/AllList.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                FRow(context),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [sell(), Search(context)],
                ),
                Divider(),
                Text(
                  "Today's Picks",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                fv_item(context),
              ],
            )),
      ),
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

Widget sell() {
  return Container(
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
  );
}

Widget Search(BuildContext context) {
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

Widget fv_item(BuildContext context) {
  return Container(
    child: Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              0.97, // Ratio of item width to item height, 1.0 for square items
        ),
        itemCount: MarketItem.length,
        itemBuilder: (context, int index) {
          return MarketList(
            Index: index,
            ItemName: MarketItem[index][0],
            Price: MarketItem[index][1],
            ImagePath: MarketItem[index][2],
          );
        },
      ),
    ),
  );
}
