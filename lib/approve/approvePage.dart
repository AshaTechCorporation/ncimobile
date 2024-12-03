import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/app/appController.dart';
import 'package:ncimobile/approve/widgets/CardApproveDisbursementWidget.dart';
import 'package:ncimobile/approve/widgets/ProjectApproveWidget.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/disbursement/widgets/HeadderDisburWidget.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/models/user.dart';
import 'package:ncimobile/project/widgets/SearchProjectWidget.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:provider/provider.dart';

class ApprovePage extends StatefulWidget {
  const ApprovePage({super.key});

  @override
  State<ApprovePage> createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  int? title = 0;
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
          HeadderDisburWidget(
            user: user,
            size: size,
            pressChat: () {},
            pressNoti: () {},
          ),
          Container(
            height: size.height * 0.73,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "การอนุมัติ",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    children: List.generate(
                        approveTitle.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    title = index;
                                  });
                                  // await listWithdrawAll(status: title == 0 ? 'open' : 'finish');
                                },
                                child: Container(
                                  width: size.width * 0.44,
                                  decoration: BoxDecoration(
                                    color: index == title ? kMainColor : Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 0.2,
                                        spreadRadius: 0.2,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        approveTitle[index],
                                        style: TextStyle(
                                          color: index == title ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                title == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                            child: Text(
                              'คำขออนุมัติโครงการ (1)',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SearchProjectWidget(size: size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                            child: ProjectApproveWidget(size: size),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                            child: Text(
                              'คำขออนุมัติเบิกจ่าย (1)',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SearchProjectWidget(size: size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                            child: CardApproveDisbursementWidget(size: size),
                          ),
                        ],
                      ),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
