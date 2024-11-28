import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsController.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/project/service/ProjcetController.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
late SharedPreferences prefs;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'th';
    initializeDateFormatting('th');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectController()),
        ChangeNotifierProvider(create: (_) => WithdrawItemsController()),
      ],
      child: MaterialApp(
        title: 'NCI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: token == null ? Loginpage() : FirstPage(),
      ),
    );
  }
}
