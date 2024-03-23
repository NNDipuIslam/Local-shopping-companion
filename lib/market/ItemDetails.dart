import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prac2/components/AllList.dart';
import 'package:prac2/market/market.dart';

class ItemMarket extends StatelessWidget {
  const ItemMarket({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Center(child: Text(MarketItem[index][0])),
            ),
            body: Container(
              margin: EdgeInsets.all(5),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        color: Colors.red,
                        child: Image(
                            image: AssetImage(MarketItem[index][2]),
                            fit: BoxFit.cover
                            /*child: Container(
                    child: Image(
                      image: AssetImage(MarketItem[index][2]),
                      fit: BoxFit.cover,
                    ),
                  ),*/
                            ),
                      ),
                    ],
                    options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                  ),
                  price(context, index),
                  product(context, index),
                  delivery(context, index),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "market");
                    },
                    child: Text('Buy This Product'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

Widget price(BuildContext context, int index) {
  return Container(
    margin: EdgeInsets.all(3),
    width: MediaQuery.of(context).size.width - 20,
    height: 60,
    alignment: Alignment.bottomCenter,
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.all(21.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            MarketItem[index][0],
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
          Text(
            MarketItem[index][1],
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    ),
  );
}

Widget product(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        "Product Information",
        style: Theme.of(context).textTheme.headline5!,
      ),
      children: [
        ListTile(
            title: Text(
          MarketItem[index][3],
          style: Theme.of(context).textTheme.bodyText1!,
        ))
      ],
    ),
  );
}

Widget delivery(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        "Delivery Information",
        style: Theme.of(context).textTheme.headline5!,
      ),
      children: [
        ListTile(
            title: Text(
          MarketItem[index][4],
          style: Theme.of(context).textTheme.bodyText1!,
        ))
      ],
    ),
  );
}

Widget FRow(BuildContext context, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, "market");
        },
        child: Icon(Icons.arrow_back),
      ),
      Text(
        MarketItem[index][0],
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
