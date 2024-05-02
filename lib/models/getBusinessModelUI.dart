// To parse this JSON data, do
//
//     final getBusinessModelUi = getBusinessModelUiFromJson(jsonString);

import 'dart:convert';

List<GetBusinessModelUi> getBusinessModelUiFromJson(String str) =>
    List<GetBusinessModelUi>.from(
        json.decode(str).map((x) => GetBusinessModelUi.fromJson(x)));

String getBusinessModelUiToJson(List<GetBusinessModelUi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBusinessModelUi {
  int id;
  String shopName;
  String shopLocation;
  String shopType;
  String phoneNumber;
  String image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String imageUrl;
  String token;

  GetBusinessModelUi({
    required this.id,
    required this.shopName,
    required this.shopLocation,
    required this.shopType,
    required this.phoneNumber,
    required this.image,
    this.createdAt,
    this.updatedAt,
    required this.imageUrl,
    required this.token,
  });

  factory GetBusinessModelUi.fromJson(Map<String, dynamic> json) =>
      GetBusinessModelUi(
        id: json["id"],
        shopName: json["ShopName"],
        shopLocation: json["ShopLocation"],
        shopType: json["ShopType"],
        phoneNumber: json["PhoneNumber"],
        image: json["Image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ShopName": shopName,
        "ShopLocation": shopLocation,
        "ShopType": shopType,
        "PhoneNumber": phoneNumber,
        "Image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
        "token": token,
      };
}
