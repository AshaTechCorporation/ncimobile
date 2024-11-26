import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/widgets/input.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  List<String> disbursement = [
    'เบิกเงินสดย่อย | ไม่เกิน 1000',
    'เบิกเงินสดย่อย | เบิกเงินชดเชย',
    'บุคลากรภายนอก',
    'ทดลองจ่าย',
    'เบี้ยเลี้ยง บุคลากรภายใน',
    'เบี้ยเลี้ยง บุคลากรภายนอก',
  ];
  String selectDisbursement = 'เบิกเงินสดย่อย | ไม่เกิน 1000';
  List<ScanResult> docScan = [];
  var options = ScanOptions();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('เพิ่มรายการ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ประเภทการเบิก',
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.08,
                child: Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'เลือกประเภทการใช้งาน',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'IBMPlexSansThai',
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: disbursement
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'IBMPlexSansThai',
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectDisbursement,
                      onChanged: (String? va) async {
                        setState(() {
                          selectDisbursement = va!;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: size.height * 0.08,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: size.height * 0.08,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'รายละเอียด',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              InputTextFormField(
                // controller: password,
                width: double.infinity,
                hintText: 'รายละเอียด',
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'แสกนรายการ',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var result = await BarcodeScanner.scan(options: options);
                      inspect(result);
                      if (result.rawContent != '') {
                        docScan.add(result);
                      }
                      setState(() {});
                    },
                    child: Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              docScan.isEmpty
                  ? SizedBox.shrink()
                  : Column(
                      children: List.generate(
                          docScan.length,
                          (index) => Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kMainColor,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'รายการ: ${docScan[index].rawContent}',
                                    ),
                                    Text(
                                      'ประเภท: ${docScan[index].type.name}',
                                    ),
                                    Text(
                                      'บรรจุ: 5',
                                    ),
                                    Text(
                                      'จำนวน: 12',
                                    ),
                                    Text(
                                      'ราคาต่อหน่วย: 100',
                                    ),
                                    Text(
                                      'ราคา: 150',
                                    ),
                                  ],
                                ),
                              )).reversed.toList(),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final clearData = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'ยืนยันล้างข้อมูลรายการ ใช่หรือไม่?',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('ยกเลิก'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ],
                        );
                      });
                  if (clearData == true) {
                    setState(() {
                      selectDisbursement = 'เบิกเงินสดย่อย | ไม่เกิน 1000';
                      docScan.clear();
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ล้างข้อมูลรายการ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'ยืนยันในตั้งเบิกรายการใหม่ ใช่ไหม?',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'ผู้เขียนรายการเบิกจะต้องตรวจสอบและแก้ไขรายการเบิกให้ถูกต้อง เพื่อให้สามารถยื่นขออนุมัติใหม่ได้อย่างเหมาะสมและมีโอกาสมากขึ้นในการได้รับการอนุมัติ',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text('ยกเลิก'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                              },
                              child: Text(
                                'ตั้งรายการเบิก',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: kCardWaitColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ยืนยันรายการ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
