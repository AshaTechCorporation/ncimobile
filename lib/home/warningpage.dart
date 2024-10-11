import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/widgets/HeadderBarWidget.dart';

class Warningpage extends StatefulWidget {
  const Warningpage({super.key});

  @override
  State<Warningpage> createState() => _WarningpageState();
}

class _WarningpageState extends State<Warningpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HeadderBarWidget(
              size: size,
              pressChat: () {},
              pressNoti: () {},
            ),
          ),
          Container(
            height: size.height * 0.8,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      Text(
                        "การแจ้งเตือน",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffe1cc775)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                      ),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffE5F2ED)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("16/06/2567 12:00", style: TextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "โครงการฝึกอบรมนักเรียนต่างประเทศ ของคุณผ่านการอนุมัติแล้ว",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(
                                    0xffDBE6E2,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("รายละเอียดโครงการ"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffF6B220)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                      ),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffFFEDD1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("16/06/2567 12:00", style: TextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "โครงการฝึกอบรมนักเรียนต่างประเทศ ของคุณผ่านการตรวจสอบ",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(
                                    0xffdf3e2c8,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("รายละเอียดโครงการ"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xff969696)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                      ),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xfffdcdcdc)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("16/06/2567 12:00", style: TextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "โครงการฝึกอบรมนักเรียนต่างประเทศ ของคุณถูกยกเลิก",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(
                                    0xffD2D2D2,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("รายละเอียดโครงการ"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
