import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/models/user.dart';

class HeadderBarWidget extends StatelessWidget {
  HeadderBarWidget({super.key, required this.size, required this.pressChat, required this.pressNoti, this.user});

  final Size size;
  final VoidCallback pressChat;
  final VoidCallback pressNoti;
  User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: kMainColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 10,
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
                            child: Image.network(
                              user?.image ?? '',
                              errorBuilder: (context, error, stackTrace) => Center(
                                child: Image.asset('assets/images/No_Image_Available.jpg'),
                              ),
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
                            '${user?.hr_employee?.fname ?? ''} ${user?.hr_employee?.lname ?? ''}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "${user?.hr_employee?.position?.name ?? ''}",
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
        ],
      ),
    );
  }
}
