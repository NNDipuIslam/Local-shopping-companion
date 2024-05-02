// To parse this JSON data, do
//
//     final getCartModelUi = getCartModelUiFromJson(jsonString);

import 'dart:convert';

List<GetCartModelUi> getCartModelUiFromJson(String str) =>
    List<GetCartModelUi>.from(
        json.decode(str).map((x) => GetCartModelUi.fromJson(x)));

String getCartModelUiToJson(List<GetCartModelUi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCartModelUi {
  int shopId;
  String itemName;
  String itemPrice;
  String image;
  String imageUrl;

  GetCartModelUi({
    required this.shopId,
    required this.itemName,
    required this.itemPrice,
    required this.image,
    required this.imageUrl,
  });

  factory GetCartModelUi.fromJson(Map<String, dynamic> json) => GetCartModelUi(
        shopId: json["ShopId"],
        itemName: json["ItemName"],
        itemPrice: json["ItemPrice"],
        image: json["Image"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "ShopId": shopId,
        "ItemName": itemName,
        "ItemPrice": itemPrice,
        "Image": image,
        "image_url": imageUrl,
      };
}
