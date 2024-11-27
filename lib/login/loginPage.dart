import 'package:flutter/material.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/login/Service/loginService.dart';
import 'package:ncimobile/widgets/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/icons/login_logo.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              InputTextFormField(
                controller: email,
                width: double.infinity,
                hintText: 'Username',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              InputTextFormField(
                controller: password,
                width: double.infinity,
                hintText: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  try {
                    LoadingDialog.open(context);
                    final login = await LoginService.login(email.text, password.text);
                    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                    final SharedPreferences prefs = await _prefs;
                    await prefs.setString('token', login['token']);
                    await prefs.setInt('userId', login['userId']);
                    if (!mounted) return;
                    LoadingDialog.close(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return FirstPage();
                    }));
                  } on Exception catch (e) {
                    if (!mounted) return;
                    LoadingDialog.close(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialogYes(
                        title: 'แจ้งเตือน',
                        description: '$e',
                        pressYes: () {
                          if (e.toString() != 'Token is expire') {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return Loginpage();
                            }));
                          }
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.65,
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ลืมรหัสผ่าน',
                style: TextStyle(color: kMainColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
