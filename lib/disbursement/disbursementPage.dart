import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/disbursement/createDisbursement/createDisbursementPage.dart';
import 'package:ncimobile/disbursement/widgets/CardDisbursementWidget.dart';
import 'package:ncimobile/disbursement/widgets/HeadderDisburWidget.dart';
import 'package:ncimobile/project/widgets/ContentProjectWidget.dart';
import 'package:ncimobile/project/widgets/SearchProjectWidget.dart';

class DisbursementPage extends StatefulWidget {
  const DisbursementPage({super.key});

  @override
  State<DisbursementPage> createState() => _DisbursementPageState();
}

class _DisbursementPageState extends State<DisbursementPage> {
  int title = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          HeadderDisburWidget(
            size: size,
            pressChat: () {},
            pressNoti: () {},
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
                      Text(
                        "การเบิกจ่ายเงิน",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CreateDisbursementPage();
                      }));
                    },
                    child: Container(
                      width: size.width * 0.98,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 204, 204, 204),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ตั้งเบิก',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('ทำการขอเบิกค่าใช้จ่ายจากเบี้ยเลี้ยงหรือโครงการ'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    'คำขอเบิกจ่ายเงินของคุณ (${contentDisbur.length})',
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          contentTitle.length,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      title = index;
                                    });
                                  },
                                  child: Container(
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
                                      child: Text(
                                        contentTitle[index],
                                        style: TextStyle(
                                          color: index == title ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),
                ////////////////////////
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Column(
                    children: List.generate(
                      disbursement.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                        child: CardDisbursementWidget(
                          size: size,
                          numPro: disbursement[index]['numPro'],
                          status: disbursement[index]['status'],
                          edit: disbursement[index]['edit'],
                          cotton: disbursement[index]['cotton'],
                          createList: disbursement[index]['createList'],
                          totalPrice: disbursement[index]['totalPrice'],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
