import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/disbursement/widgets/HeadderDisburWidget.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsController.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsService.dart';
import 'package:ncimobile/listProduct/WithdarwSearch/withdarwSearchPage.dart';
import 'package:ncimobile/listProduct/addItem/addItemPage.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:provider/provider.dart';

class ListProducrPage extends StatefulWidget {
  const ListProducrPage({super.key});

  @override
  State<ListProducrPage> createState() => _ListProducrPageState();
}

class _ListProducrPageState extends State<ListProducrPage> {
  var options = ScanOptions();
  int? title = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await listWithdrawAll(status: title == 0 ? 'open' : 'finish');
    });
  }

  Future listWithdrawAll({String? search, String? status}) async {
    try {
      LoadingDialog.open(context);
      await context.read<WithdrawItemsController>().getListWithdraw(search: search, status: status);
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

  String convertToBuddhistDate(DateTime date) {
    int buddhistYear = date.year + 543;
    return "${date.day}/${date.month}/$buddhistYear";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Consumer<WithdrawItemsController>(
        builder: (BuildContext context, controller, Widget? child) {
          return ListView(
            shrinkWrap: true,
            children: [
              HeadderDisburWidget(
                size: size,
                pressChat: () {},
                pressNoti: () {},
              ),
              Container(
                height: controller.listWithdraws?.isEmpty ?? true ? size.height * 0.73 : null,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เบิกพัสดุ",
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //       return AddItemPage();
                          //     }));
                          //   },
                          //   child: Icon(
                          //     Icons.add_circle_outline_outlined,
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AddItemPage();
                          }));
                        },
                        child: Container(
                          width: size.width * 0.98,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 204, 204, 204),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ตั้งเบิกพัสดุ',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text('ทำการขอเบิกพัสดุและอุปกรณ์'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return WithdarwSearchPage();
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
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Row(
                        children: List.generate(
                            withdrawTitle.length,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                  child: GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        title = index;
                                      });
                                      await listWithdrawAll(status: title == 0 ? 'open' : 'finish');
                                    },
                                    child: Container(
                                      width: size.width * 0.44,
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
                                        child: Center(
                                          child: Text(
                                            withdrawTitle[index],
                                            style: TextStyle(
                                              color: index == title ? Colors.white : Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                    controller.listWithdraws?.isEmpty ?? true
                        ? SizedBox.shrink()
                        : title == 0
                            ? SizedBox(
                                height: size.height * 0.38,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        controller.listWithdraws?.length ?? 0,
                                        (index) => GestureDetector(
                                          onTap: () async {
                                            final approved = await showDialog<String>(
                                              barrierDismissible: false,
                                              barrierColor: Color.fromARGB(217, 158, 158, 158),
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                  'แจ้งเตือน',
                                                  style: TextStyle(fontSize: 20),
                                                ),
                                                content: Text(
                                                  'ยืนยันเบิกพัสดุ',
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                actions: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('ออก'),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context, 'cancel');
                                                    },
                                                    child: Text(
                                                      'ยกเลิกเบิก',
                                                      style: TextStyle(color: Colors.red),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context, 'finish');
                                                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                                                    },
                                                    child: Text(
                                                      'ยืนยัน',
                                                      style: TextStyle(color: Colors.amber),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (approved != '' && approved != null) {
                                              LoadingDialog.open(context);
                                              await WithdrawItemsService.approvedWinthdraw(id: controller.listWithdraws![index].id.toString(), status: approved!);
                                              await listWithdrawAll(status: title == 0 ? 'open' : 'finish');
                                              LoadingDialog.close(context);
                                            }
                                          },
                                          child: Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.symmetric(vertical: 8),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          // ${DateTime.parse(controller.listWithdraws![index].date!).formatTo('dd MMM yy')}
                                                          Text(
                                                            'เบิกวันที่:  ${convertToBuddhistDate(DateTime.parse(controller.listWithdraws![index].date!))}',
                                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                          ),
                                                          Text(
                                                            'เลขที่ใบเบิก: ${controller.listWithdraws?[index].code ?? ''}',
                                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: size.width * 0.3,
                                                        padding: EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                          color: Colors.red,
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
                                                              controller.listWithdraws?[index].approved == 'finish' ? 'สำเร็จ' : 'รอยืนยันการเบิก',
                                                              style: TextStyle(color: Colors.white, fontSize: 12),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'ผู้เบิก: ${controller.listWithdraws?[index].user?.hr_employee?.fname ?? ''}  ${controller.listWithdraws?[index].user?.hr_employee?.lname ?? ''}',
                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'รายละเอียดการเบิก: ${controller.listWithdraws?[index].remark ?? ' - '}',
                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: size.height * 0.38,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        controller.listWithdraws?.length ?? 0,
                                        (index) => Container(
                                            width: double.infinity,
                                            margin: const EdgeInsets.symmetric(vertical: 8),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey, width: 1),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // ${DateTime.parse(controller.listWithdraws![index].date!).formatTo('dd MMM yy')}
                                                        Text(
                                                          'เบิกวันที่:  ${convertToBuddhistDate(DateTime.parse(controller.listWithdraws![index].date!))}',
                                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(
                                                          'เลขที่ใบเบิก: ${controller.listWithdraws?[index].code ?? ''}',
                                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: size.width * 0.3,
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
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
                                                          Center(
                                                            child: Text(
                                                              controller.listWithdraws?[index].approved == 'finish' ? 'สำเร็จ' : 'รอยืนยันการเบิก',
                                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'ผู้เบิก: ${controller.listWithdraws?[index].user?.hr_employee?.fname ?? ''}  ${controller.listWithdraws?[index].user?.hr_employee?.lname ?? ''}',
                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  'รายละเอียดการเบิก: ${controller.listWithdraws?[index].remark ?? ' - '}',
                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
