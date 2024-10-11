import 'package:flutter/material.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/editPassword.dart';
import 'package:ncimobile/home/editProfile.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/project/widgets/HeadderProjectWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          HeadderProjectWidget(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                      },
                      child: Row(
                        children: [
                          Text(
                            'แก้ไข',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
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
                        children: [Icon(Icons.person), Text('นางสาว สมศรี รักศึกษา')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Icon(Icons.email), Text('placeholder.mail@somemail.ac.th')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Icon(Icons.phone), Text('+66  1234567890')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Icon(Icons.file_copy), Text('แผนก ภาษาไทย')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditPassword()));
                  },
                  child: Row(
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
