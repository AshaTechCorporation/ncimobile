import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:ncimobile/widgets/input.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final picker = ImagePicker();
  List<File> listimages = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('ร้องเรียน'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ชื่อ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              FromRegister(
                  width: size.width * 0.9,
                  // controller: fname,
                  // labelText: ' รหัสบัตรประชาชน',
                  hintText: 'กรอกชื่อ',
                  // icons: Icon(
                  //   Icons.person,
                  //   color: const Color.fromARGB(255, 78, 60, 237),
                  // ),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'กรุณากรอกชื่อ';
                    }
                    // else if (!Validator.verifyThaiId(value)) {
                    //   return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                    // }
                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "นามสกุล",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              FromRegister(
                width: size.width * 0.9,
                // controller: lname,
                // labelText: ' รหัสบัตรประชาชน',
                hintText: 'กรอกนามสกุล',
                // icons: Icon(
                //   Icons.person,
                //   color: const Color.fromARGB(255, 78, 60, 237),
                // ),
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'กรุณากรอกนามสกุล';
                  }
                  // else if (!Validator.verifyThaiId(value)) {
                  //   return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                  // }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "อีเมล",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              FromRegister(
                width: size.width * 0.9,
                // controller: email,
                // labelText: ' รหัสบัตรประชาชน',
                hintText: 'xxx@xxx.com',
                // icons: Icon(
                //   Icons.person,
                //   color: const Color.fromARGB(255, 78, 60, 237),
                // ),
                // revealIdentity == false
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'กรุณากรอกอีเมล';
                  }
                  // else if (!Validator.verifyThaiId(value)) {
                  //   return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                  // }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'รายละเอียดเรื่องร้องเรียน',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red, // เปลี่ยนสีเป็นสีแดง
                      ),
                    ),
                  ],
                ),
              ),
              FromRegister(
                width: size.width * 0.9,
                // controller: detail,
                hintText: 'รายละเอียด',
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'กรุณากรอกรายละเอียด';
                  }
                  // else if (!Validator.verifyThaiId(value)) {
                  //   return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                  // }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "แนบรูปภาพ",
                style: TextStyle(fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 240,
                child: GridView.builder(
                    itemCount: listimages.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Container(
                              margin: EdgeInsets.all(10),
                              color: Colors.grey[300],
                              child: Center(
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      chooseImage();
                                    }),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(5),
                              // decoration: BoxDecoration(
                              //     image:
                              //         DecorationImage(image: FileImage(File(listimages[index - 1].path)), fit: BoxFit.cover)),
                              child: GestureDetector(
                                onTap: () {
                                  OpenFile.open(listimages[index - 1].path);
                                },
                                child: Stack(children: [
                                  Center(
                                    child: Image.file(
                                      listimages[index - 1],
                                      scale: 5,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          listimages.removeAt(index - 1);
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final clearData = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'คุณต้องการที่จะออกจากหน้า ใช่หรือไม่',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('ยกเลิก'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ],
                        );
                      });
                  if (clearData == true) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final withdraw = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'ต้องการที่จะส่งเรื่องร้องเรียน ใช่หรืแไม่',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('ยกเลิก'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                              },
                              child: Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ],
                        );
                      });
                  if (withdraw == true) {
                    try {
                      LoadingDialog.open(context);

                      LoadingDialog.close(context);
                      Navigator.pop(context);
                    } on ClientException catch (e) {
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
                    } on ApiException catch (e) {
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
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: kCardWaitColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ร้องเรียน',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    Map<Permission, PermissionStatus> statues = await [Permission.storage, Permission.photos].request();
    PermissionStatus? statusStorage = statues[Permission.storage];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusStorage == PermissionStatus.granted && statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      //openCameraGallery();
      //_openDialog(context);
    }
    bool isPermanentlyDenied = statusStorage == PermissionStatus.permanentlyDenied || statusPhotos == PermissionStatus.permanentlyDenied;
    if (isPermanentlyDenied) {
      // _showSettingsDialog(context);
    }
    final pickedFiles = await picker.pickMultiImage();

    for (var i = 0; i < pickedFiles.length; i++) {
      // listimages.clear();
      listimages.add(File(pickedFiles[i].path));
    }
    setState(() {});
  }
}
