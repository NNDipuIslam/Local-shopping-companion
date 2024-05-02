// To parse this JSON data, do
//
//     final getProductsModelUi = getProductsModelUiFromJson(jsonString);

import 'dart:convert';

List<GetProductsModelUi> getProductsModelUiFromJson(String str) =>
    List<GetProductsModelUi>.from(
        json.decode(str).map((x) => GetProductsModelUi.fromJson(x)));

String getProductsModelUiToJson(List<GetProductsModelUi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductsModelUi {
  String itemName;
  String itemPrice;
  String image;
  String productInformation;
  String deliveryInformation;
  String imageUrl;

  GetProductsModelUi({
    required this.itemName,
    required this.itemPrice,
    required this.image,
    required this.productInformation,
    required this.deliveryInformation,
    required this.imageUrl,
  });

  factory GetProductsModelUi.fromJson(Map<String, dynamic> json) =>
      GetProductsModelUi(
        itemName: json["ItemName"],
        itemPrice: json["ItemPrice"],
        image: json["Image"],
        productInformation: json["ProductInformation"],
        deliveryInformation: json["DeliveryInformation"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "ItemName": itemName,
        "ItemPrice": itemPrice,
        "Image": image,
        "ProductInformation": productInformation,
        "DeliveryInformation": deliveryInformation,
        "image_url": imageUrl,
      };
}
