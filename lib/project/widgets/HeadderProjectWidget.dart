import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

class HeadderProjectWidget extends StatelessWidget {
  HeadderProjectWidget({super.key, required this.size, required this.pressChat, required this.pressNoti});

  final Size size;
  final VoidCallback pressChat;
  final VoidCallback pressNoti;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: kMainColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 56, 56, 56),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'assets/images/Frame2.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "xxxxxxxxxxxxxxxxxxx",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "xxxxxxxxxxxxxxx",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat,
                          color: Colors.white,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
