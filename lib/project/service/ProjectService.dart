import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/models/project.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectService {
  const ProjectService();

  static Future<List<Project>> getListProjects({String? status, String? perPage, String? page, String? search, String? page_type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/plan/project/page', {
      if (perPage != null) "perPage": perPage,
      if (page != null) "page": page,
      "search": search,
      "page_type": page_type,
      "filterStatus": status,
    });
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data["data"]["data"] as List;
      return list.map((e) => Project.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }

  static Future<List<Project>> getListProjectsAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/plan/project');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data["data"] as List;
      return list.map((e) => Project.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }

  static Future<Project> getProjectID({required int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/plan/project/$id');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return Project.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }
}
