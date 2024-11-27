import 'package:ncimobile/constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ncimobile/utils/ApiExeption.dart';

class LoginService {
  const LoginService();

  static Future login(
    String username,
    String password,
  ) async {
    final url = Uri.https(publicUrl, '/api/login');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final dataOut = {
        "token": data['token'],
        "userId": data['data']['id'],
      };
      return dataOut;
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }
}
