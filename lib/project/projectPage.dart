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
                                child: ContentProjectWidget(
                                  title: contentTitle[index],
                                  press: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProjectDetailPage()));
                                  },
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
                      'โครงการทั้งหมด (5)',
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
                        projects.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                          child: CardContentProjectWidget(
                            size: size,
                            budget: projects[index]['budget'],
                            startDate: projects[index]['startDate'],
                            status: projects[index]['status'],
                            endDate: projects[index]['endDate'],
                            projectID: projects[index]['projectID'],
                          ),
                        ),
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
