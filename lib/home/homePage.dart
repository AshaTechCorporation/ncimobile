import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/app/appController.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/widgets/HeadderBarWidget.dart';
import 'package:ncimobile/home/widgets/ListContentWidget.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/models/user.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          HeadderBarWidget(
            user: user,
            size: size,
            pressChat: () {},
            pressNoti: () {},
          ),

          //////////////////
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ปฏิทินประจำสัปดาห์ ${DateFormat('dd MMMM y').format(DateTime.now())}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  activeColor: Colors.black,
                  timeLineProps: EasyTimeLineProps(
                    hPadding: BorderSide.strokeAlignCenter,
                  ),
                  dayProps: EasyDayProps(
                    todayHighlightColor: Colors.transparent,
                    dayStructure: DayStructure.dayStrDayNum,
                    // width: 64.0,
                    height: 80,
                    activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 255, 241, 51),
                            Colors.amber,
                            Color.fromARGB(255, 255, 241, 51),
                          ],
                        ),
                      ),
                    ),
                    inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: Colors.transparent, // สีพื้นหลังของวันที่ไม่ได้เลือก
                        border: Border.all(style: BorderStyle.none), // เอากรอบออก
                      ),
                    ),
                  ),
                  headerProps: EasyHeaderProps(showHeader: false, monthPickerType: MonthPickerType.switcher),
                  onDateChange: (selectedDate) {
                    //`selectedDate` the new date selected.
                    print(selectedDate);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: Icon(
                            Icons.filter_list,
                            size: 30,
                          ),
                        ),
                        Text(
                          "ประกาศจากฝ่ายการเงิน",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ////////////////////////
                  ListContentWidget(size: size),
                ],
              ))
        ],
      ),
    );
  }
}
