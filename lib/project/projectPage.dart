import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/project/projectDetailPage.dart';
import 'package:ncimobile/project/widgets/CardContentProjectWidget.dart';
import 'package:ncimobile/project/widgets/ContentProjectWidget.dart';
import 'package:ncimobile/project/widgets/HeadderProjectWidget.dart';
import 'package:ncimobile/project/widgets/SearchProjectWidget.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int? title = 0;
  List<Map<String, dynamic>> listPro = [];

  @override
  void initState() {
    super.initState();
    listPro = projects;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
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
                  SearchProjectWidget(size: size),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Row(
                      children: List.generate(
                          contentTitle.length,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      title = index;
                                    });
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

                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      'โครงการทั้งหมด (${projects.length})',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Column(
                      children: List.generate(
                        listPro.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                            child: CardContentProjectWidget(
                              size: size,
                              budget: listPro[index]['budget'],
                              startDate: listPro[index]['startDate'],
                              status: listPro[index]['status'],
                              endDate: listPro[index]['endDate'],
                              projectID: listPro[index]['projectID'],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
