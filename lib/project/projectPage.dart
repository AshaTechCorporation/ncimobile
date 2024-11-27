import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/models/project.dart';
import 'package:ncimobile/project/projectDetailPage.dart';
import 'package:ncimobile/project/service/ProjcetController.dart';
import 'package:ncimobile/project/widgets/CardContentProjectWidget.dart';
import 'package:ncimobile/project/widgets/ContentProjectWidget.dart';
import 'package:ncimobile/project/widgets/HeadderProjectWidget.dart';
import 'package:ncimobile/project/widgets/SearchPage.dart';
import 'package:ncimobile/project/widgets/SearchProjectWidget.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  static const numberOfPostsPerRequest = 10;
  final PagingController<int, Project> pagingController = PagingController(firstPageKey: 1);
  int? title = 0;
  List<Map<String, dynamic>> listPro = [];
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await listProjectsAll();
    });
    // pagingController.addPageRequestListener((pageKey) {
    //   fetchPage(pageKey);
    // });
  }

  // Future<void> fetchPage(int pageKey) async {
  //   try {
  //     listProjects(page: title == 0 ? null : pageKey.toString(), perPage: title == 0 ? null : numberOfPostsPerRequest.toString());
  //   } catch (e) {
  //     pagingController.error = e;
  //   }
  // }

  Future listProjects({String? status, String? perPage, String? page, String? search, String? page_type}) async {
    await context.read<ProjectController>().getProjects(status: status, perPage: perPage, page: page, search: search, page_type: page_type);
  }

  Future listProjectsAll() async {
    try {
      LoadingDialog.open(context);
      await context.read<ProjectController>().getProjectsAll();
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
            if (e.toString() != 'Token is expire') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Loginpage();
              }));
            }
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
            if (e.toString() != 'Token is expire') {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Loginpage();
              }));
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Consumer<ProjectController>(
        builder: (BuildContext context, controller, Widget? child) => ListView(
          shrinkWrap: true,
          children: [
            HeadderProjectWidget(
              size: size,
              pressChat: () {},
              pressNoti: () {},
            ),
            Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "โครงการของฉัน",
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////////
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SearchPage();
                        }));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.06,
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Text(
                                'ค้นหาโครงการ',
                                style: TextStyle(fontSize: 14.0, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    //   child: TextFormField(
                    //     onTap: () {
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //         return SearchPage();
                    //       }));
                    //     },
                    //     decoration: InputDecoration(
                    //       hintText: 'ค้นหาโครงการ',
                    //       hintStyle: const TextStyle(fontSize: 14.0, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                    //       contentPadding: const EdgeInsets.all(5),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       prefixIcon: Icon(Icons.search),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              contentTitle.length,
                              (index) => Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                    child: GestureDetector(
                                      onTap: () async {
                                        LoadingDialog.open(context);
                                        title = index;
                                        index == 0
                                            ? await listProjectsAll()
                                            : await listProjects(
                                                status: index == 1
                                                    ? 'submit'
                                                    : index == 2
                                                        ? 'wait_plan'
                                                        : index == 3
                                                            ? 'wait_head_plan'
                                                            : index == 4
                                                                ? 'approved'
                                                                : index == 5
                                                                    ? 'file_uploaded'
                                                                    : index == 6
                                                                        ? 'add_send_plan_approver'
                                                                        : index == 7
                                                                            ? 'wait_plan_approved_approver'
                                                                            : index == 8
                                                                                ? 'approved_approver'
                                                                                : index == 9
                                                                                    ? 'accounting_approved_approver'
                                                                                    : index == 10
                                                                                        ? 'add_send_board_approver'
                                                                                        : index == 11
                                                                                            ? 'board_approved'
                                                                                            : index == 12
                                                                                                ? 'add_approver'
                                                                                                : index == 13
                                                                                                    ? 'wait_approve_operation'
                                                                                                    : index == 14
                                                                                                        ? 'process'
                                                                                                        : index == 15
                                                                                                            ? 'close_project'
                                                                                                            : 'approved_close_project');
                                        LoadingDialog.close(context);
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: index == title ? kMainColor : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
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
                                          child: Text(
                                            contentTitle[index],
                                            style: TextStyle(
                                              color: index == title ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Text(
                        'โครงการทั้งหมด (${controller.projects?.length ?? 0})',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    controller.projects?.isEmpty ?? true
                        ? SizedBox(
                            width: double.infinity,
                            height: size.height * 0.4,
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: size.height * 0.55,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                    controller.projects!.length,
                                    (index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                                        child: CardContentProjectWidget(
                                          project: controller.projects![index],
                                          size: size,
                                          budget: '${NumberFormat('#,##0', 'en_US').format(int.parse(controller.projects?[index].total ?? '0'))} บาท',
                                          name: controller.projects?[index].name ?? '',
                                          // startDate: DateFormat('yyyy-MM-dd').format(controller.projects?[index].created_at ?? DateTime.now()),
                                          startDate: 'เดือน ${controller.projects?[index].start_month ?? 0} ปี ${controller.projects?[index].start_year ?? 0}',
                                          status: controller.projects?[index].status ?? '',
                                          endDate: 'เดือน ${controller.projects?[index].end_month ?? 0} ปี ${controller.projects?[index].end_year ?? 0}',
                                          projectID: controller.projects?[index].code ?? '',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
