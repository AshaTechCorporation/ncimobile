import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/disbursement/createDisbursement/buildDisbursementPage.dart';

class CreateDisbursementPage extends StatefulWidget {
  const CreateDisbursementPage({super.key});

  @override
  State<CreateDisbursementPage> createState() => _CreateDisbursementPageState();
}

class _CreateDisbursementPageState extends State<CreateDisbursementPage> {
  final yesrs = DateFormat.yMMMMEEEEd();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งเบิกรายการ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "โครงการที่สามารถตั้งเบิกได้",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
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
                    Text('25681010123'),
                    Text(
                      'โครงการ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'วันที่เริ่มโครงการ : ${DateFormat('dd/MM/y').format(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'วันที่สิ้นสุดโครงการ : ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'งบประมาณโครงการ : 10,000,000.00 บาท',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return BuildDisbursementPage();
                        }));
                      },
                      child: Container(
                        height: size.height * 0.04,
                        width: size.width * 0.98,
                        color: Color.fromARGB(255, 224, 223, 223),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('ตั้งเบิกรายการใหม่'), Icon(Icons.arrow_forward)],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
