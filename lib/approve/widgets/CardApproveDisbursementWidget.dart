import 'package:flutter/material.dart';
import 'package:ncimobile/approve/DetailApprove.dart';
import 'package:ncimobile/constants.dart';

class CardApproveDisbursementWidget extends StatelessWidget {
  const CardApproveDisbursementWidget({
    super.key,
    required this.size,
  });

  final Size size;

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2233-4455-6677'),
                      Text(
                        'ตั้งเบิกทั่วไป',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.06,
                    decoration: BoxDecoration(
                      color: kCardWaitColor,
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
                        Center(
                          child: Text(
                            'รออนุมัติ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ฝ่าย',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'รวมราคาเบิก',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ภาษาไทย',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '14,100 บาท',
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สร้างรายการ',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'แก้ไขล่าสุด',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '10/12/2567',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '10/12/2567',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailApprove()));
                },
                child: Container(
                  height: size.height * 0.04,
                  width: size.width * 0.98,
                  color: Color.fromARGB(255, 221, 215, 215),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('อ่านรายละเอียดเพิ่มเติม'), Icon(Icons.arrow_forward)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
