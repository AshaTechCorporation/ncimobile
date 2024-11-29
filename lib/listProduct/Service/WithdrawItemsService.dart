import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/models/department/SupItemTOAPI/sendItem.dart';
import 'package:ncimobile/models/department/department.dart';
import 'package:ncimobile/models/item/item.dart';
import 'package:ncimobile/models/withdrawItem.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WithdrawItemsService {
  const WithdrawItemsService();

  static Future<List<Department>> getListDepartments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/get_department_stock');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data["data"] as List;
      return list.map((e) => Department.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }

  static Future<Item> searchBarCode({required String barcode, required int department}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/sup/get_item_by_lot_marker', {
      "lot_maker": barcode,
      "hr_ci_department_id": department,
    });
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return Item.fromJson(data["data"]);
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }

  static Future<WithdrawItem> addWinthdraw({
    required String date,
    required int hr_ci_department_id,
    required int user_id,
    required String sup_pr_use,
    required String remark,
    required List<SendItem> sup_item_trans,
  }) async {
    final url = Uri.https(publicUrl, '/api/sup/sub_withdraw');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final response = await http.post(url,
        headers: headers,
        body: convert.jsonEncode({
          'date': date,
          'hr_ci_department_id': hr_ci_department_id,
          'user_id': user_id,
          'sup_pr_use': sup_pr_use,
          'remark': remark,
          'sup_item_trans': sup_item_trans,
        }));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return WithdrawItem.fromJson(data["data"]);
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }

  static Future<WithdrawItem> approvedWinthdraw({
    required String id,
    required String status,
  }) async {
    final url = Uri.https(publicUrl, '/api/sup/update_approved_sub_withdraw/$id');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final response = await http.put(url,
        headers: headers,
        body: convert.jsonEncode({
          'approved': status,
          'approved_remark': '',
        }));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return WithdrawItem.fromJson(data["data"]);
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }

  static Future<List<WithdrawItem>> getListWithdraw({
    String? search,
    String? status,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/sup/sub_withdraw/page', {
      "perPage": '50',
      "page": '1',
      "search": search,
      "approved": status,
    });
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data["data"]["data"] as List;
      return list.map((e) => WithdrawItem.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw ApiException(data['message']);
    }
  }
}
