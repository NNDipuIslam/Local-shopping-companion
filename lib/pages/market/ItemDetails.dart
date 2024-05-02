import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prac2/components/AllList.dart';
import 'package:prac2/pages/market/market.dart';

class ItemMarket extends StatelessWidget {
  final String itemName;
  final String price;
  final String imagePath;
  final String productInfo;
  final String deliveryInfo;

  const ItemMarket({
    Key? key,
    required this.itemName,
    required this.price,
    required this.imagePath,
    required this.productInfo,
    required this.deliveryInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(itemName)),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView(
            children: [
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  Container(
                    color: Colors.red,
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              ),
              // price and name
              Container(
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
                        itemName,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        price.toString() + "tk",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              // product
              Padding(
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
                        productInfo,
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                    )
                  ],
                ),
              ),
              // delivery
              Padding(
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
                        deliveryInfo,
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 100),
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
        ),
      ),
    );
  }
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
        // MarketItem[index] as String, // Ensure MarketItem[index] is a string
        'hi',
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
