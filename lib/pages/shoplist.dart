import 'package:flutter/material.dart';

class MyShop extends StatelessWidget {
  final String shopName;
  final String address;
  final String ImagePath;
  final String star;
  const MyShop({
    super.key,
    required this.shopName,
    required this.address,
    required this.ImagePath,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "shop");
      },
      child: Container(
        margin: EdgeInsets.all(11),
        child: Column(children: [
          AspectRatio(
            aspectRatio: 16 / 7,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10),
                  topRight:Radius.circular(10), ), // Set the circular border radius
              child: Image(
                image: AssetImage(ImagePath),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
                
                children: [
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shopName,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          // Text size
                        ),
                      ),
                      Container(
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,),
                        
                        Text(
                          star,
                          style: TextStyle(
                            fontSize: 18.0, // Text size
                          ),
                        ),
                      ],
                    ),
                  ),
                       
                      
                    ],
                  ),
                  Container(
                         child: Row(
                           children: [
                            Icon(Icons.place,color: Colors.green[200],),
                             Text(
                              address,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w200,
                                // Text size
                              ),
                                                 ),
                           ],
                         ),
                       ),
        ]),
      ),
      ])));
  }
}
