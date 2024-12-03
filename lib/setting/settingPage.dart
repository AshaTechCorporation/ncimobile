import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/app/appController.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/models/user.dart';
import 'package:ncimobile/project/widgets/HeadderProjectWidget.dart';
import 'package:ncimobile/setting/Report/ReportPage.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getUser();
    });
  }

  getUser() async {
    try {
      await context.read<AppController>().initialize();
      final user2 = context.read<AppController>().user;
      setState(() {
        user = user2;
      });
    } on ClientException catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '$e',
          pressYes: () {
            if (e.toString() != 'Token is expire' && e.toString() != 'Can not verify identity') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Loginpage();
              }));
            }
          },
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '$e',
          pressYes: () {
            if (e.toString() != 'Token is expire' && e.toString() != 'Can not verify identity') {
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
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          HeadderProjectWidget(
            user: user,
            size: size,
            pressChat: () {},
            pressNoti: () {},
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "ตั้งค่าการใช้งาน",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ข้อมูลส่วนบุคคล",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          'แก้ไข',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [Icon(Icons.person), Text('${user?.hr_employee?.fname ?? ''} ${user?.hr_employee?.lname ?? ''}')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Icon(Icons.email), Text('${user?.hr_employee?.email ?? ''}')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Icon(Icons.phone), Text('${user?.hr_employee?.tel ?? ''}')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Icon(Icons.file_copy), Text('แผนก ${user?.hr_employee?.ci_department?.name ?? ''}')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "รหัสผ่าน",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          'แก้ไข',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ReportPage();
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ร้องเรียน",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "การแจ้งเตือน",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "การแสดงผล",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () async {
                    final out = await showDialog(
                      context: context,
                      builder: (context) => AlertDialogYesNo(
                        title: 'แจ้งเตือน',
                        description: 'ต้องการยืนยันที่จะออกจากระบบ',
                        pressYes: () {
                          Navigator.pop(context, true);
                        },
                        pressNo: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    );
                    if (out == true) {
                      LoadingDialog.open(context);
                      clearToken();
                      if (!mounted) return;
                      LoadingDialog.close(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return Loginpage();
                      }));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ออกจากระบบ",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: size.height * 0.50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> clearToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // String? deviceName = pref.getString('device_name');
    await pref.clear();
  }
}
