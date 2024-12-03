import 'package:flutter/material.dart';
import 'package:ncimobile/app/appService.dart';
import 'package:ncimobile/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  AppController({this.appService = const AppService()});

  final AppService appService;
  SharedPreferences? pref;
  User? user;

  Future<void> initialize() async {
    pref = await SharedPreferences.getInstance();
    final id = pref?.getInt('userId');

    user = await appService.getProfile(id!.toString());

    notifyListeners();
  }
}
