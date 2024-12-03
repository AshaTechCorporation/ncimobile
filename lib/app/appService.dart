import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/models/user.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  const AppService();

  Future<User> getProfile(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.https(publicUrl, '/api/user/$id');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return User.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }
}
