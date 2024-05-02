import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class checkAccountRepo {
  static FutureOr<String?> check(String email, String password) async {
    var client = http.Client();
    var data = {
      'email': email,
      'password': password,
    };
    print(1);
    try {
      var response = await client.post(
        Uri.parse('http://192.168.63.70:8000/api/login'),
        headers: {
          'Content-Type': 'application/json', // Specify JSON content type
        },
        body: json.encode(data),
      );
      print(response.body.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String? token = responseData['data']['token'];
        return token;
      }
    } catch (e) {
      return null;
    } finally {
      client.close();
    }
    return null;
  }
}
