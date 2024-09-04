import 'package:flutter/material.dart';
import 'package:ncimobile/approve/DetailApprove.dart';
import 'package:ncimobile/constants.dart';

class ProjectApproveWidget extends StatelessWidget {
  const ProjectApproveWidget({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('25681010123'),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'โครงการฝึกอบรมนักเรียนต่างประเทศ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'วันที่เริ่มโครงการ : 10/10/2068',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'วันที่สิ้นสุดโครงการ : 10/10/2569',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'งบประมาณโครงการ : 10,000,000.00 บาท',
                      style: TextStyle(fontSize: 12),
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
                          'กำลังตรวจสอบ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('อ่านรายละเอียดเพิ่มเติม'), Icon(Icons.arrow_forward)],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
