import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

class AlertDialogYes extends StatefulWidget {
  AlertDialogYes({Key? key, required this.description, this.pressYes, required this.title, InkWell? onTap}) : super(key: key);
  final String title, description;
  final VoidCallback? pressYes;

  @override
  State<AlertDialogYes> createState() => _AlertDialogYesState();
}

class _AlertDialogYesState extends State<AlertDialogYes> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.grey, // ตรวจสอบว่ามีการกำหนดค่า kTextButtonColor แล้ว
      title: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20, // ปรับขนาดใหญ่ขึ้นเล็กน้อยเพื่อความเด่นชัด
            fontWeight: FontWeight.bold, // เพิ่มความหนาของตัวอักษรเพื่อความเด่นชัด
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // เพิ่ม padding ให้ข้อความไม่ชิดขอบ
        child: Text(
          widget.description,
          style: TextStyle(
            fontSize: 16, // ลดขนาดตัวอักษรลงเล็กน้อยเพื่อความสมดุล
          ),
          textAlign: TextAlign.center, // ตั้งค่าการจัดตำแหน่งข้อความให้อยู่ตรงกลาง
        ),
      ),
      actionsAlignment: MainAxisAlignment.center, // ปรับการจัดตำแหน่งของปุ่มให้อยู่กลาง
      actions: [
        GestureDetector(
          onTap: widget.pressYes,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            height: size.height * 0.05,
            width: size.width * 0.3,
            child: Center(
              child: Text(
                'ตกลง',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AlertDialogYesNo extends StatefulWidget {
  AlertDialogYesNo({Key? key, required this.description, this.pressYes, this.pressNo, required this.title, InkWell? onTap}) : super(key: key);
  final String title, description;
  final VoidCallback? pressYes;
  final VoidCallback? pressNo;

  @override
  State<AlertDialogYesNo> createState() => _AlertDialogYesNoState();
}

class _AlertDialogYesNoState extends State<AlertDialogYesNo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.grey, // ตรวจสอบว่ามีการกำหนดค่า kTextButtonColor แล้ว
      title: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20, // ปรับขนาดใหญ่ขึ้นเล็กน้อยเพื่อความเด่นชัด
            fontWeight: FontWeight.bold, // เพิ่มความหนาของตัวอักษรเพื่อความเด่นชัด
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // เพิ่ม padding ให้ข้อความไม่ชิดขอบ
        child: Text(
          widget.description,
          style: TextStyle(
            fontSize: 16, // ลดขนาดตัวอักษรลงเล็กน้อยเพื่อความสมดุล
          ),
          textAlign: TextAlign.center, // ตั้งค่าการจัดตำแหน่งข้อความให้อยู่ตรงกลาง
        ),
      ),
      // actionsAlignment: MainAxisAlignment.center, // ปรับการจัดตำแหน่งของปุ่มให้อยู่กลาง
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: widget.pressNo,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 227, 227, 227),
                ),
                height: size.height * 0.05,
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: widget.pressYes,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kMainColor,
                ),
                height: size.height * 0.05,
                width: size.width * 0.25,
                child: Center(
                  child: Text(
                    'ตกลง',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
