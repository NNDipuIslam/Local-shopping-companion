import 'package:flutter/material.dart';

class MarketList extends StatelessWidget {
  final String ImagePath;
  final String ItemName;
  final String Price;
  final int Index;

  const MarketList({
    super.key,
    required this.Index,
    required this.ItemName,
    required this.Price,
    required this.ImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/MarketItemDetails', arguments: Index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 9 / 7,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ), // Set the circular border radius
                child: Image(
                  image: AssetImage(ImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  ItemName + ".",
                  style: TextStyle(
                    fontSize: 20.0,
                    // Text size
                  ),
                ),
                Icon(Icons.attach_money),
                Text(
                  Price,
                  style: TextStyle(
                    fontSize: 20.0,

                    // Text size
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
