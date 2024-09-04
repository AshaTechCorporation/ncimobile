import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/widgets/input.dart';

class BuildDisbursementPage extends StatefulWidget {
  const BuildDisbursementPage({super.key});

  @override
  State<BuildDisbursementPage> createState() => _BuildDisbursementPageState();
}

class _BuildDisbursementPageState extends State<BuildDisbursementPage> {
  String selectMoney = 'เงินสด';
  List<String> money = [
    'เงินสด',
    'เช็ค',
  ];
  String selectDisbursement = 'เบิกเงินสดย่อย | ไม่เกิน 1000';
  List<String> disbursement = [
    'เบิกเงินสดย่อย | ไม่เกิน 1000',
    'เบิกเงินสดย่อย | เบิกเงินชดเชย',
    'บุคลากรภายนอก',
    'ทดลองจ่าย',
    'เบี้ยเลี้ยง บุคลากรภายใน',
    'เบี้ยเลี้ยง บุคลากรภายนอก',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งเบิกรายการใหม่'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ประเภทการเบิก',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
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
            InputTextFormField(
              width: double.infinity,
              hintText: 'รหัสโครงการ',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'รายการเบิก',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'เพิ่มรายการเบิก',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(Icons.close)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'ชื่อรายการ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextFormField(
                                      width: double.infinity,
                                      hintText: 'ตัวอย่าง',
                                    ),
                                    Text(
                                      'ราคาต่อหน่อย (บาท)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextFormField(
                                      width: double.infinity,
                                      hintText: 'ราคาต่อหน่อย (บาท)',
                                    ),
                                    Text(
                                      'จำนวนรายการ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextFormField(
                                      width: double.infinity,
                                      hintText: 'จำนวนรายการ',
                                    ),
                                    SizedBox(
                                      height: size.height * 0.08,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        height: size.height * 0.05,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: kMainColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'เพิ่มรายการ',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Icon(Icons.add_circle_outline)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'ในขณะนี้ยังไม่มีรายการเบิกชำระเงินใดๆกรณาทำการเพิ่มรายการเบิกชำระเงินให้เรียบร้อยก่อนดำเนินการ',
              style: TextStyle(color: Color.fromARGB(255, 180, 179, 179)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'หลักฐานการเบิก',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'เพิ่มรายการเบิก',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(Icons.close)),
                                      ],
                                    ),
                                    Text(
                                      'ชื่อรายการ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextFormField(
                                      width: double.infinity,
                                      hintText: 'ตัวอย่าง',
                                    ),
                                    Text(
                                      'ราคาต่อหน่อย (บาท)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextFormField(
                                      width: double.infinity,
                                      hintText: 'ราคาต่อหน่อย (บาท)',
                                    ),
                                    Text(
                                      'จำนวนรายการ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextFormField(
                                      width: double.infinity,
                                      hintText: 'จำนวนรายการ',
                                    ),
                                    SizedBox(
                                      height: size.height * 0.08,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        height: size.height * 0.05,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: kMainColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'เพิ่มรายการ',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Icon(Icons.add_circle_outline)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'ในขณะนี้ยังไม่มีรายการเบิกชำระเงินใดๆกรณาทำการเพิ่มรายการเบิกชำระเงินให้เรียบร้อยก่อนดำเนินการ',
              style: TextStyle(color: Color.fromARGB(255, 180, 179, 179)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'รูปแบบการจ่ายเงิน',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
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
                    items: money
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
                    value: selectMoney,
                    onChanged: (String? va) async {
                      setState(() {
                        selectMoney = va!;
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
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                      'ตั้งรายการเบิก',
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
