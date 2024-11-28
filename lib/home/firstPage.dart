import 'package:flutter/material.dart';
import 'package:ncimobile/approve/approvePage.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/disbursement/disbursementPage.dart';
import 'package:ncimobile/home/homePage.dart';
import 'package:ncimobile/listProduct/listProducrPage.dart';
import 'package:ncimobile/project/projectPage.dart';
import 'package:ncimobile/setting/settingPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePage();

  void onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        currentPage = HomePage();
      } else if (selectedIndex == 1) {
        currentPage = ProjectPage();
      } else if (selectedIndex == 2) {
        currentPage = DisbursementPage();
      } else if (selectedIndex == 3) {
        currentPage = ApprovePage();
      } else if (selectedIndex == 4) {
        currentPage = ListProducrPage();
      } else if (selectedIndex == 5) {
        currentPage = SettingPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageStorage(bucket: bucket, child: currentPage),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onItemSelect,
          items: [
            BottomNavigationBarItem(
                icon: selectedIndex == 0 ? Image.asset('assets/icons/calendar_today_color.png') : Image.asset('assets/icons/calendar_today.png'), label: 'หน้าข่าวสาร'),
            BottomNavigationBarItem(icon: selectedIndex == 1 ? Image.asset('assets/icons/description_color.png') : Image.asset('assets/icons/description.png'), label: 'โครงการ'),
            BottomNavigationBarItem(icon: selectedIndex == 2 ? Image.asset('assets/icons/table_view_color.png') : Image.asset('assets/icons/table_view.png'), label: 'เบิก-จ่าย'),
            BottomNavigationBarItem(
                icon: selectedIndex == 3 ? Image.asset('assets/icons/edit_calendar_color.png') : Image.asset('assets/icons/edit_calendar.png'), label: 'อนุมัติ'),
            BottomNavigationBarItem(
                icon: selectedIndex == 4
                    ? Icon(Icons.card_giftcard, color: kMainColor, size: 38)
                    : Icon(Icons.card_giftcard, color: const Color.fromARGB(255, 104, 104, 104), size: 38),
                label: 'เบิกพัสดุ'),
            BottomNavigationBarItem(icon: selectedIndex == 5 ? Image.asset('assets/icons/settings_color.png') : Image.asset('assets/icons/settings.png'), label: 'ตั้งค่า'),
          ],
        ));
  }
}
