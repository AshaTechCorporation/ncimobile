import 'package:flutter/material.dart';
import 'package:ncimobile/Dialog/DialogYesNo.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/widgets/input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final double coverHight = 100;
  final double profileHight = 100;
  final TextEditingController newName = TextEditingController();
  final TextEditingController newEmail = TextEditingController();
  final TextEditingController newNumberPhone = TextEditingController();
  final forkey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    final double top = (coverHight - profileHight / 2) - 10;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          ' แก้ไขข้อมูล',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kMainColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              buildCoverImage(),
              Positioned(
                top: top,
                child: buildProfileImage(),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: Text(
              "นางสาว สมศรี รักศึกษา",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Form(
            key: forkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      'Username',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: InputTextFormField(
                      style: TextStyle(fontSize: 15),
                      colorfill: KFillColor,
                      height: size.height * 0.09,
                      controller: newName,
                      width: double.infinity,
                      hintText: 'Username',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'กรุณากรอก Username';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: InputTextFormField(
                      style: TextStyle(fontSize: 15),
                      colorfill: KFillColor,
                      height: size.height * 0.09,
                      controller: newEmail,
                      width: double.infinity,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        String? pattern = r'^([a-zA-Z0-9_.+-]+)@([a-zA-Z0-9-]+\.)+([a-zA-Z0-9]{2,4})+$';
                        RegExp regex = RegExp(pattern);
                        if (value?.isEmpty ?? true) {
                          return 'กรุณากรอก Email';
                        } else if (!regex.hasMatch(value!)) {
                          return 'รูปแบบ Email ไม่ถูกต้อง';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      'PhoneNumber',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: InputTextFormField(
                      style: TextStyle(fontSize: 15),
                      colorfill: KFillColor,
                      height: size.height * 0.09,
                      controller: newNumberPhone,
                      width: double.infinity,
                      hintText: 'PhoneNumber',
                      keyboardType: TextInputType.phone, // เปลี่ยนเป็น phone

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'กรุณากรอก PhoneNumber';
                        } else if (value!.length != 10) {
                          return 'เบอร์โทรศัพท์ต้องมีเลข 10 หลัก';
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'รูปแบบเบอร์โทรไม่ถูกต้อง';
                        }
                        return null; // ไม่มีข้อผิดพลาด
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (forkey.currentState!.validate()) {
                          final ok = await showDialog(
                              context: context,
                              builder: (context) {
                                return Dialogyesno(
                                  title: 'แจ้งเตือน',
                                  description: 'คุณต้องการแก้ไขโปรไฟร์หรือไม่?',
                                  pressNo: () {
                                    Navigator.pop(context);
                                  },
                                  pressYes: () {
                                    Navigator.pop(context, true);
                                  },
                                  bottomNameYes: 'ตกลง',
                                  bottomNameNo: 'ยกเลิก',
                                );
                              });
                          if (ok == true) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                          }
                        }
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kMainColor),
                        child: Center(
                          child: Text(
                            "บันทึก",
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
        ],
      ),
    );
  }

  Widget buildCoverImage() => Stack(children: [
        Container(
          color: kMainColor,
          width: double.infinity,
          height: coverHight,
        ),
      ]);

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHight / 2,
        child: ClipOval(
          child: Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 56, 56, 56),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/Frame2.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
