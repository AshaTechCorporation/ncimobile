import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/widgets/input.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final TextEditingController originalPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController ConfirNewPassword = TextEditingController();
  final forkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            height: size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            child: Form(
              key: forkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // เพิ่มปุ่มย้อนกลับ
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "แก้ไขรหัสผ่าน",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        'รหัสผ่านเดิม',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: InputTextFormFieldPassword(
                        style: TextStyle(fontSize: 15),
                        colorfill: KFillColor,
                        obscureText: true,
                        width: size.width * 0.8,
                        hintText: 'กรอกรหัสผ่านเดิม',
                        controller: originalPassword,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'กรุณากรอกรหัสผ่านเดิม';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        'รหัสผ่านใหม่',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: InputTextFormFieldPassword(
                        style: TextStyle(fontSize: 15),
                        colorfill: KFillColor,
                        width: size.width * 0.8,
                        hintText: 'กรอกรหัสผ่านใหม่',
                        controller: newPassword,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'กรุณากรอกรหัสผ่านใหม่';
                          } else if (value!.length < 8) {
                            return 'รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        'ยืนยันผ่านใหม่',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: InputTextFormFieldPassword(
                        style: TextStyle(fontSize: 15),
                        colorfill: KFillColor,
                        width: size.width * 0.8,
                        hintText: 'ยืนยันรหัสผ่านใหม่',
                        controller: ConfirNewPassword,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'กรุณายืนยันรหัสผ่านใหม่';
                          } else if (value != newPassword.text) {
                            return 'รหัสผ่านไม่ตรงกัน';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (forkey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                          }
                        },
                        child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kMainColor),
                          child: Center(
                            child: Text(
                              "แก้ไขรหัสผ่าน",
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
