import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

class CardContentProjectWidget extends StatelessWidget {
  const CardContentProjectWidget({super.key, required this.size, required this.budget, required this.endDate, required this.projectID, required this.startDate, required this.status});

  final Size size;
  final String projectID;
  final String status;
  final String startDate;
  final String endDate;
  final String budget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$projectID'),
            Text('โครงการ'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.06,
                        decoration: BoxDecoration(
                          color: status == 'รอดำเนินการ'
                              ? kMainColor
                              : status == 'กำลังตรวจสอบ'
                                  ? kCardWaitColor
                                  : kCardApproveColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                              child: Text(
                                'สถานะ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Text(
                                '$status',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('วันที่เริ่มโครงการ : ${startDate}'),
                          Text('วันที่สิ้นสุดโครงการ : ${endDate}'),
                          Text('งบประมาณโครงการ : ${budget}'),
                        ],
                      ))
                ],
              ),
            ),
            Container(
              height: size.height * 0.04,
              width: size.width * 0.90,
              color: Color.fromARGB(255, 221, 215, 215),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('อ่านรายละเอียดเพิ่มเติม'), Icon(Icons.arrow_forward)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
