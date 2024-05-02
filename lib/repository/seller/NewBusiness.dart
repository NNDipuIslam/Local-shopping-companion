import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NewBusiness {
  static Future<bool> create(String ShopName, String ShopLocation,
      String ShopType, String PhoneNumber, File image) async {
    var client = http.Client();
    var data = {
      'ShopName': ShopName,
      'ShopLocation': ShopLocation,
      'ShopType': ShopType,
      'PhoneNumber': PhoneNumber,
      'Image': image
    };
    try {
      print(2);
      var response = await http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.63.70:8000/api/start'),
        //body: json.encode(data),
        //  body: json.encode(data),
      );
      response.fields['ShopName'] = ShopName;
      response.fields['ShopLocation'] = ShopLocation;
      response.fields['ShopType'] = ShopType;
      response.fields['PhoneNumber'] = PhoneNumber;

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
