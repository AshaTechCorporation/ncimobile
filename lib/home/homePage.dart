import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/widgets/HeadderBarWidget.dart';
import 'package:ncimobile/home/widgets/ListContentWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          HeadderBarWidget(
            size: size,
            pressChat: () {},
            pressNoti: () {},
          ),

          //////////////////
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: Icon(
                            Icons.filter_list,
                            size: 30,
                          ),
                        ),
                        Text(
                          "ประกาศจากฝ่ายการเงิน",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ////////////////////////
                  ListContentWidget(size: size),
                ],
              ))
        ],
      ),
    );
  }
}


