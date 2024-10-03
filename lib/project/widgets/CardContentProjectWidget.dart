import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/models/project.dart';
import 'package:ncimobile/project/projectDetailPage.dart';

class CardContentProjectWidget extends StatelessWidget {
  const CardContentProjectWidget(
      {super.key,
      required this.size,
      required this.budget,
      required this.endDate,
      required this.projectID,
      required this.startDate,
      required this.status,
      required this.name,
      required this.project});
  final Project project;
  final Size size;
  final String projectID;
  final String status;
  final String startDate;
  final String endDate;
  final String budget;
  final String name;

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
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'รหัสโครงการ: $projectID',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'ชื่อโครงการ: $name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        // height: size.height * 0.09,
                        width: size.width * 0.06,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: status == 'submit'
                              ? kMainColor
                              : status == 'wait_plan'
                                  ? kCardWaitColor
                                  : status == 'wait_head_plan'
                                      ? kCardApproveColor
                                      : status == 'approved'
                                          ? kBlueO
                                          : status == 'file_uploaded'
                                              ? kOrangeS
                                              : status == 'add_send_plan_approver'
                                                  ? kgreenM
                                                  : status == 'wait_plan_approved_approver'
                                                      ? kpink
                                                      : status == 'approved_approver'
                                                          ? kCran
                                                          : status == 'accounting_approved_approver'
                                                              ? kGreenA
                                                              : status == 'add_send_board_approver'
                                                                  ? kOrangeA
                                                                  : status == 'board_approved'
                                                                      ? kOrange
                                                                      : status == 'add_approver'
                                                                          ? kPupueG
                                                                          : status == 'wait_approve_operation'
                                                                              ? kPupue
                                                                              : status == 'process'
                                                                                  ? kGreen
                                                                                  : status == 'close_project'
                                                                                      ? kBlueW
                                                                                      : kRed,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'สถานะ',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              status == 'submit'
                                  ? 'หัวหน้ากง.ตรวจสอบ'
                                  : status == 'wait_plan'
                                      ? 'รอแผนตรวจสอบ'
                                      : status == 'wait_head_plan'
                                          ? 'รอหัวหน้าแผนตรวจสอบ'
                                          : status == 'approved'
                                              ? 'นำเสนออนุมัติ/กรม'
                                              : status == 'file_uploaded'
                                                  ? 'กรมอนุมัติ'
                                                  : status == 'add_send_plan_approver'
                                                      ? 'อนมุติโครงการไปยังแผน'
                                                      : status == 'wait_plan_approved_approver'
                                                          ? 'รอแผนอนุมัติโครงการ'
                                                          : status == 'approved_approver'
                                                              ? 'แผนอนุมัติโครงการแล้ว'
                                                              : status == 'accounting_approved_approver'
                                                                  ? 'การเงินอนุมัติโครงการแล้ว'
                                                                  : status == 'add_send_board_approver'
                                                                      ? 'อนุมัติโครงการไปยังผู้บริหาร'
                                                                      : status == 'board_approved'
                                                                          ? 'โครงการอนุมัติแล้ว'
                                                                          : status == 'add_approver'
                                                                              ? 'ขออนุมัติจัดโครงการ'
                                                                              : status == 'wait_approve_operation'
                                                                                  ? 'อนุมัติจัดโครงการ'
                                                                                  : status == 'process'
                                                                                      ? 'กำลังดำเนินการ'
                                                                                      : status == 'close_project'
                                                                                          ? 'ขออนุมัติปิดโครงการ'
                                                                                          : 'ปิดโครงการแล้ว',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('วันที่เริ่มโครงการ : ${startDate}'),
                          Text('วันที่สิ้นสุดโครงการ : ${endDate}'),
                          Text('งบประมาณโครงการ : ${budget}'),
                        ],
                      ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProjectDetailPage(
                              projectID: project.id!,
                            )));
              },
              child: Container(
                height: size.height * 0.04,
                width: size.width * 0.90,
                color: Color.fromARGB(255, 221, 215, 215),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('อ่านรายละเอียดเพิ่มเติม'),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
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
