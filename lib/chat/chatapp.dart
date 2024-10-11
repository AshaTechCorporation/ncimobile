import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // สร้างตัวอย่างข้อมูลผู้ใช้
  final ChatUser user = ChatUser(id: '1', firstName: 'User');

  // สร้างรายการข้อความเริ่มต้น (List ที่เก็บข้อความแชท)
  List<ChatMessage> messages = [
    ChatMessage(
      text: "Hello, how are you?",
      user: ChatUser(id: '2', firstName: 'Bot'),
      createdAt: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      text: "I'm fine, thank you!",
      user: ChatUser(id: '1', firstName: 'User'),
      createdAt: DateTime.now().subtract(Duration(minutes: 4)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text('ติดต่อ Admin'),
          ],
        ),
      ),
      body: DashChat(
        currentUser: user, // กำหนดผู้ใช้ปัจจุบัน
        messages: messages, // กำหนดรายการข้อความที่จะแสดง
        onSend: (ChatMessage message) {
          // เมื่อผู้ใช้กดส่งข้อความ จะเพิ่มข้อความใหม่ลงในรายการ
          setState(() {
            messages.add(message);
          });
          print("Message sent: ${message.text}");
        },
        messageOptions: MessageOptions(
          currentUserContainerColor: kMainColor, // สีของข้อความผู้ใช้
          containerColor: kMainColor.withOpacity(0.2), // สีของข้อความอื่นๆ (อาจจางลงเพื่อเน้นข้อความผู้ใช้)
          textColor: Colors.white, // สีของข้อความที่แสดง
        ),
        inputOptions: InputOptions(
          inputTextStyle: TextStyle(color: kMainColor), // สีข้อความที่พิมพ์ใน input
        ),
      ),
    );
  }
}
