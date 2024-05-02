import 'dart:convert';
import 'package:prac2/models/getCartModelUI.dart';
import 'package:http/http.dart' as http;

class getItem {
  static Future<List<GetCartModelUi>> fetch() async {
    print("get");
    var client = http.Client();
    List<GetCartModelUi> posts = [];
    try {
      var response =
          await client.get(Uri.parse('http://192.168.63.70:8000/api/getItems'));
      print(response.statusCode);
      print(response.body.toString());
      //   List<dynamic> result =
      //     jsonDecode(utf8.decode(response.bodyBytes))["results"];
      List<dynamic> result = jsonDecode(response.body);
      print(2);
      for (int i = 0; i < result.length; i++) {
        GetCartModelUi post = GetCartModelUi.fromJson(result[i]);
        posts.add(post);
      }
      //  print("hello");
      //print(response.body.toString());
      return posts;
    } catch (e) {
      print("catch");
      return [];
    }
  }
}
