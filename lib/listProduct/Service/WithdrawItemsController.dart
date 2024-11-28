import 'package:flutter/material.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsService.dart';
import 'package:ncimobile/models/department/department.dart';
import 'package:ncimobile/models/withdrawItem.dart';

class WithdrawItemsController extends ChangeNotifier {
  WithdrawItemsController({this.withdrawItemsController = const WithdrawItemsService()});
  WithdrawItemsService? withdrawItemsController;

  List<Department>? departments = [];
  List<WithdrawItem>? listWithdraws = [];

  getDepartments({String? status, String? perPage, String? page, String? search, String? page_type}) async {
    departments?.clear();
    departments = await WithdrawItemsService.getListDepartments();

    notifyListeners();
  }

  getListWithdraw({String? perPage, String? page, String? search, String? status}) async {
    listWithdraws?.clear();
    listWithdraws = await WithdrawItemsService.getListWithdraw(search: search, status: status);

    notifyListeners();
  }
}
