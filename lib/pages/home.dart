import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prac2/pages/shoplist.dart';
import 'package:prac2/components/AllList.dart';
import 'package:prac2/pages/NavBar.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navBar(),
      appBar: appbar(context),
      body: Container(
         margin: EdgeInsets.all(12),
        child:Column(
          children: [
            Text("All Shops", style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),),
            SizedBox(height: 5,),
            
            ShopList(context),
          ],
        )
      ),
    );
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
              Navigator.pushNamed(context, "cart");
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

Widget Search(BuildContext context) {
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

Widget ShopList(BuildContext context) {
  return  Container(
    child: Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.6),
        itemCount: shopName.length,
        itemBuilder: (context, int index) {
          return MyShop(
            shopName: ShopName[index][0],
            address: ShopName[index][1],
            ImagePath: ShopName[index][2],
            star: ShopName[index][3],
          );
        },
      ),
    ),
  );
}
