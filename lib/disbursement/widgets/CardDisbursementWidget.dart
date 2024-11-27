import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

class CardDisbursementWidget extends StatelessWidget {
  const CardDisbursementWidget(
      {super.key, required this.size, required this.cotton, required this.createList, required this.edit, required this.numPro, required this.status, required this.totalPrice});

  final Size size;
  final String numPro;
  final String status;
  final String cotton;
  final String totalPrice;
  final String createList;
  final String edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
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
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$numPro'),
                    Text(
                      'ตั้งเบิกทั่วไป',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.085,
                  width: size.width * 0.32,
                  decoration: BoxDecoration(
                    color: status == 'กำลังดำเนินการ'
                        ? kMainColor
                        : status == 'เสร็จสิ้น'
                            ? kCardApproveColor
                            : kCardWaitColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'สถานะ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            status,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('ฝ่าย'), Text('รวมราคาเบิก')],
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Text('$cotton'), Text('$totalPrice')],
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('สร้างรายการ'), Text('แก้ไขล่าสุด')],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Text('$createList'), Text('$edit')],
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              height: size.height * 0.04,
              width: size.width * 0.98,
              color: Color.fromARGB(255, 221, 215, 215),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('อ่านรายละเอียดเพิ่มเติม'), Icon(Icons.arrow_forward)],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
