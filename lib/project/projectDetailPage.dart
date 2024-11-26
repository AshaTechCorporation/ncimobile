import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/project/service/ProjcetController.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:provider/provider.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key, required this.projectID});
  final int projectID;

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int activeStep = 2;
  double progress = 0.2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await projectBYid();
    });
  }

  Future projectBYid() async {
    try {
      LoadingDialog.open(context);
      await context.read<ProjectController>().getProject(id: widget.projectID);
      if (!mounted) return;
      LoadingDialog.close(context);
    } on ClientException catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '$e',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '$e',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  String getMonthName(int monthNumber) {
    const List<String> monthNames = ['มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน', 'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม'];

    // ตรวจสอบว่า monthNumber อยู่ในช่วง 1-12
    if (monthNumber < 1 || monthNumber > 12) {
      return 'Invalid month';
    }

    return monthNames[monthNumber - 1]; // ลบ 1 เพื่อให้ตรงกับ index ของ List
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('รายละเอียดโครงการ'),
      ),
      body: Consumer<ProjectController>(
        builder: (BuildContext context, controller, child) {
          return controller.project == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            Text(
                              "ชื่อโครงการ: ",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            Text(
                              controller.project?.name ?? '',
                              style: TextStyle(fontSize: 22, color: Colors.black),
                            ),
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            Text(
                              "สถานะโครงการ: ",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            Text(
                              controller.project?.status == 'submit'
                                  ? 'หัวหน้ากง.ตรวจสอบ'
                                  : controller.project?.status == 'wait_plan'
                                      ? 'รอแผนตรวจสอบ'
                                      : controller.project?.status == 'wait_head_plan'
                                          ? 'รอหัวหน้าแผนตรวจสอบ'
                                          : controller.project?.status == 'approved'
                                              ? 'นำเสนออนุมัติ/กรม'
                                              : controller.project?.status == 'file_uploaded'
                                                  ? 'กรมอนุมัติ'
                                                  : controller.project?.status == 'add_send_plan_approver'
                                                      ? 'อนมุติโครงการไปยังแผน'
                                                      : controller.project?.status == 'wait_plan_approved_approver'
                                                          ? 'รอแผนอนุมัติโครงการ'
                                                          : controller.project?.status == 'approved_approver'
                                                              ? 'แผนอนุมัติโครงการแล้ว'
                                                              : controller.project?.status == 'accounting_approved_approver'
                                                                  ? 'การเงินอนุมัติโครงการแล้ว'
                                                                  : controller.project?.status == 'add_send_board_approver'
                                                                      ? 'อนุมัติโครงการไปยังผู้บริหาร'
                                                                      : controller.project?.status == 'board_approved'
                                                                          ? 'โครงการอนุมัติแล้ว'
                                                                          : controller.project?.status == 'add_approver'
                                                                              ? 'ขออนุมัติจัดโครงการ'
                                                                              : controller.project?.status == 'wait_approve_operation'
                                                                                  ? 'อนุมัติจัดโครงการ'
                                                                                  : controller.project?.status == 'process'
                                                                                      ? 'กำลังดำเนินการ'
                                                                                      : controller.project?.status == 'close_project'
                                                                                          ? 'ขออนุมัติปิดโครงการ'
                                                                                          : 'ปิดโครงการแล้ว',
                              style: TextStyle(fontSize: 22, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: EasyStepper(
                            activeStep: controller.project!.histories!.length,
                            lineStyle: LineStyle(
                              lineLength: 20,
                              lineThickness: 1,
                              lineSpace: 5,
                              lineType: LineType.normal,
                              unreachedLineType: LineType.dashed,
                            ),
                            stepRadius: 20,
                            unreachedStepIconColor: Colors.black87,
                            unreachedStepBorderColor: Colors.black54,
                            unreachedStepTextColor: Colors.black,
                            showLoadingAnimation: false,
                            borderThickness: 2,
                            internalPadding: 10,
                            finishedStepBorderColor: kMainColor,
                            finishedStepTextColor: kMainColor,
                            finishedStepBackgroundColor: kMainColor,
                            activeStepIconColor: kMainColor,
                            steps: List.generate(
                              controller.project?.histories?.length ?? 0,
                              (indexT) {
                                for (int i = 0; i < controller.project!.histories!.length; i++) {
                                  if (i % 2 == 0) {
                                    print('ตำแหน่ง $i (เลขคู่):');
                                  } else {
                                    print('ตำแหน่ง $i (เลขคี่): ');
                                  }
                                }
                                return EasyStep(
                                    customStep: CircleAvatar(
                                      radius: 12,
                                      child: Icon(Icons.check),
                                      // backgroundColor: controller.doc!.timeline![indexT].process_status == false ? Colors.grey : const Color.fromARGB(255, 5, 240, 13),
                                    ),
                                    // title: controller.project?.histories?[indexT].title ?? '',
                                    topTitle: indexT % 2 == 0 ? true : false,
                                    customTitle: SizedBox(
                                      child: Text(
                                        controller.project?.histories?[indexT].title ?? '',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ));
                              },
                            ),
                            // steps: [
                            //   EasyStep(
                            //     icon: Icon(Icons.check),
                            //     title: 'รอดำเนินการ',
                            //     //lineText: '1.7 KM',
                            //   ),
                            //   EasyStep(
                            //     icon: Icon(CupertinoIcons.cube_box),
                            //     title: 'กำลังตรวจสอบ',
                            //     //lineText: '3 KM',
                            //     topTitle: true,
                            //   ),
                            //   EasyStep(
                            //     icon: Icon(CupertinoIcons.flag),
                            //     title: 'อนุมัติ',
                            //   ),
                            // ],
                            //onStepReached: (index) => setState(() => activeStep = index),
                          ),
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
                        Html(
                          data: controller.project?.rational ?? ' - ',
                          style: {
                            "body": Style(
                              fontFamily: 'Prompt',
                            ),
                          },
                        ),
                        // Text(
                        //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consectetur ligula sed tellus consectetur, at ornare enim finibus. Phasellus lacus mi, varius sit amet maximus ut, pulvinar sed nulla. Nam dapibus, nunc.'),

                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Text(
                                  'รหัสโครงการ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                )),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  'ปีการศึกษา',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                )),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  'แหล่งเงิน',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 4, child: Text(controller.project?.code ?? ' - ')),
                            Expanded(flex: 3, child: Text(controller.project?.fiscal_year ?? ' - ')),
                            Expanded(flex: 4, child: Text(controller.project?.money_type?.name ?? ' - ')),
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

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              controller.project?.responsible?.length ?? 0,
                              (indexRepons) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ชื่อ - สกุล: ${controller.project?.responsible?[indexRepons].name ?? ''}'),
                                  Text('เบอร์โทรศัพท์: ${controller.project?.responsible?[indexRepons].phone ?? ''}'),
                                  Text('E-mail: ${controller.project?.responsible?[indexRepons].email ?? ''}'),
                                  Text('ตำแหน่ง: ${controller.project?.responsible?[indexRepons].position ?? ''}'),
                                  Divider()
                                ],
                              ),
                            )),
                        // Row(
                        //   children: [
                        //     Text('ณัฐพงษ์ รัตนโกสินทร์'),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Text('สิริพร มณีการ'),
                        //   ],
                        // ),
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
                                    Text(
                                      'วันที่เริ่มโครงการ',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    Text(
                                        'เดือน ${controller.project?.start_month == null ? ' - ' : getMonthName(controller.project?.start_month ?? 0)} พ.ศ.${controller.project?.start_year?.toString() ?? " - "}'),
                                    Text(
                                      'วันที่สิ้นสุดโครงการ',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    Text(
                                        'เดือน ${controller.project?.end_month == null ? ' - ' : getMonthName(controller.project?.end_month ?? 0)} พ.ศ.${controller.project?.end_year?.toString() ?? " - "}'),
                                  ],
                                )),
                            Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'งบประมาณของโครงการ',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    Text('${NumberFormat('#,##0', 'en_US').format(int.parse(controller.project?.total ?? '0'))} บาท'),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "รายชื่อผู้อนุมัติ",
                        //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Text('สมศรี รักศึกษา'),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "เอกสารที่เกี่ยวข้อง",
                        //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.02,
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
                        //             Text('หนังสือเสนอโครงการ (แก้ไขล่าสุด 09/09/2567)'),
                        //           ],
                        //         )),
                        //   ],
                        // ),
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
                        // SizedBox(
                        //   height: size.height * 0.1,
                        // ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
