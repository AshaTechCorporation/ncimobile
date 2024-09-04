import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailApprove extends StatefulWidget {
  const DetailApprove({super.key});

  @override
  State<DetailApprove> createState() => _DetailApproveState();
}

class _DetailApproveState extends State<DetailApprove> {
  int activeStep = 0;
  double progress = 0.2;
  List<bool> check = [
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('รายละเอียดโครงการ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "สถานะการเบิก",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              EasyStepper(
                activeStep: activeStep,
                lineStyle: LineStyle(
                  lineLength: 100,
                  lineThickness: 1,
                  lineSpace: 5,
                  lineType: LineType.normal,
                ),
                stepRadius: 15,
                unreachedStepIconColor: Colors.black87,
                unreachedStepBorderColor: Colors.black54,
                unreachedStepTextColor: Colors.black,
                showLoadingAnimation: false,
                steps: const [
                  EasyStep(
                    icon: Icon(Icons.check),
                    title: 'รอดำเนินการ',
                    //lineText: '1.7 KM',
                  ),
                  EasyStep(
                    icon: Icon(CupertinoIcons.cube_box),
                    title: 'กำลังตรวจสอบ',
                    //lineText: '3 KM',
                  ),
                  EasyStep(
                    icon: Icon(CupertinoIcons.flag),
                    title: 'อนุมัติ',
                  ),
                ],
                //onStepReached: (index) => setState(() => activeStep = index),
              ),
              Row(
                children: [
                  Text(
                    "ผลการอนุมัติ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: check[index] == true ? Color.fromARGB(255, 164, 239, 203) : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: check[index] == true ? Color(0xff38CC85) : Colors.black),
                        ),
                        leading: Checkbox(
                          side: WidgetStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              width: 1.5,
                              color: check[index] == true ? Color(0xff38CC85) : Colors.grey,
                            ),
                          ),
                          activeColor: check[index] == true ? Color.fromARGB(255, 164, 239, 203) : null,
                          checkColor: Color(0xff38CC85),
                          value: check[index],
                          onChanged: (v) {},
                        ),
                        title: Text('ผลอนุมัติ'),
                        subtitle: Text('สุริยา สุริยกุล'),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "เลขงบประมาณ",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "2233-4455-6677",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "แหล่งเงินงบประมาณ",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "งบประจำปี",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "รายการเบิกพร้อมค่าใช้จ่าย",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text('- หนังสืออ่านนอกเวลา (50)'),
              Text('      - ราคาต่อหน่อย: 150 บาท'),
              Text('      - ราคารวม: 7,500 บาท'),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "สรุปค่าใช้จ่าย",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text('- รวมราคารายการเบิก: 14,100 บาท'),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "รูปแบบการจ่ายเงิน",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text('- เงินสด'),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "เอกสารที่เกี่ยวข้อง",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.04,
                            width: size.width * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'PDF',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('หนังสือเสนอเบิกงบประมาณ (แก้ไขล่าสุด 09/09/2567)'),
                        ],
                      )),
                ],
              ),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Expanded(
              //         flex: 2,
              //         child: Column(
              //           children: [
              //             Container(
              //               height: size.height * 0.04,
              //               width: size.width * 0.12,
              //               decoration: BoxDecoration(
              //                 color: Colors.amber,
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   'PDF',
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         )),
              //     Expanded(
              //         flex: 10,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text('หนังสือประเมินค่าใช้จ่าย (แก้ไขล่าสุด 15/10/2567)'),
              //           ],
              //         )),
              //   ],
              // ),

              SizedBox(
                height: size.height * 0.1,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: size.height * 0.05,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFD82E18),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ปฏิเสธ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final out = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'ยืนยันในการ อนุมัติ ใบเบิกของ [ชื่อโครงการ] ใช่ไหม?',
                                style: TextStyle(fontSize: 15),
                              ),
                              content: Text(
                                'การอนุมัติโครงการนี้หมายความว่าผู้มีอำนาจได้พิจารณาและตัดสินใจที่จะให้งบประมาณสำหรับโครงการ [ชื่อโครงการ] โดยไม่สามารถแก้ไขหรือเปลี่ยนแปลงคำอนุมัติได้อีกนี่เป็นการสิ้นสุดกระบวนการอนุมัติและเตรียมพร้อมสำหรับการดำเนินงานตามแผนการที่ได้รับการอนุมัติ',
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
                                    Navigator.pop(context, true);
                                    setState(() {
                                      check[0] = true;
                                    });
                                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                                  },
                                  child: Text(
                                    'อนุมัติ',
                                    style: TextStyle(
                                      color: Color(0xFF03703C),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                      if (out == true) {
                        setState(() {
                          check[0] = true;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: size.height * 0.05,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Color(0xFF03703C),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'อนุมัติ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
