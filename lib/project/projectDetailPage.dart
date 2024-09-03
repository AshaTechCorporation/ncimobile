import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int activeStep = 0;
  double progress = 0.2;

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
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "โครงการ",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "สถานะโครงการ",
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
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "รายละเอียดโครงการ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur ligula sed tellus consectetur, at ornare enim finibus. Phasellus lacus mi, varius sit amet maximus ut, pulvinar sed nulla. Nam dapibus, nunc.'),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 4, child: Text('รหัสโครงการ')),
                  Expanded(flex: 3, child: Text('ปีการศึกษา')),
                  Expanded(flex: 4, child: Text('แหล่งเงิน')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 4, child: Text('25681010123')),
                  Expanded(flex: 3, child: Text('2567')),
                  Expanded(flex: 4, child: Text('งบประจำปี')),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "ผู้รับผิดชอบโครงการ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text('ฐิติพร แซ่ลิ้ม'),
                ],
              ),
              Row(
                children: [
                  Text('ณัฐพงษ์ รัตนโกสินทร์'),
                ],
              ),
              Row(
                children: [
                  Text('สิริพร มณีการ'),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('วันที่เริ่มโครงการ'),
                          Text('10/10/2068'),
                          Text('วันที่สิ้นสุดโครงการ'),
                          Text('10/10/2569'),
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('งบประมาณของโครงการ'),
                          Text('10,000,000.00 บาท'),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "รายชื่อผู้อนุมัติ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('สมศรี รักศึกษา'),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
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
                          Text('หนังสือเสนอโครงการ (แก้ไขล่าสุด 09/09/2567)'),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
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
                          Text('หนังสือประเมินค่าใช้จ่าย (แก้ไขล่าสุด 15/10/2567)'),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: size.height * 0.20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
