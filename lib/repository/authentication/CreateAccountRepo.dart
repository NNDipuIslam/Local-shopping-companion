import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class CreateAccountRepo {
  static Future<bool> create(
      String name, String email, String password, String cpassword) async {
    var client = http.Client();
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'c_password': cpassword
    };
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.193:8000/api/register'),
        headers: {
          'Content-Type': 'application/json', // Set Content-Type header
        },
        body: jsonEncode(data),
      );
      print(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
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
