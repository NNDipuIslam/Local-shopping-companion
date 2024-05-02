import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NewProducts {
  static Future<bool> create(String ItemName, String ItemPrice, File image,
      String ProductInfo, String DeliveryInfo) async {
    var client = http.Client();
    var data = {
      'ItemName': ItemName,
      'ItemPrice': ItemPrice,
      'Image': image,
      'ProductInformation': ProductInfo,
      'DeliveryInformation': DeliveryInfo
    };
    try {
      print(2);
      var response = await http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.63.70:8000/api/sell'),
        //body: json.encode(data),
        //  body: json.encode(data),
      );
      response.fields['ItemName'] = ItemName;
      response.fields['ItemPrice'] = ItemPrice;
      response.fields['ProductInformation'] = ProductInfo;
      response.fields['DeliveryInformation'] = DeliveryInfo;

      // Add image file
      var fileStream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile('Image', fileStream, length,
          filename: image.path.split('/').last);
      response.files.add(multipartFile);
      var request = await http.Response.fromStream(await response.send());
      print(request.body.toString());
      print(request.statusCode);
      if (request.statusCode >= 200 && request.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      client.close();
    }
  }
}
