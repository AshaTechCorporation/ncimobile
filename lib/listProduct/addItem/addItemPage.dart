import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/Dialog.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsController.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsService.dart';
import 'package:ncimobile/login/loginPage.dart';
import 'package:ncimobile/models/department/department.dart';
import 'package:ncimobile/models/item/item.dart';
import 'package:ncimobile/utils/ApiExeption.dart';
import 'package:ncimobile/widgets/input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/department/SupItemTOAPI/sendItem.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  Department? selectDepartment;
  List<AddItem> docScan = [];
  var options = ScanOptions();
  List<SendItem> withdrawItemAPI = [];
  final TextEditingController remark = TextEditingController();
  int? departmentId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getSharedPreferences();
      await getDepartmentsAll();
    });
  }

  Future<void> getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    departmentId = prefs.getInt('departmentId');
  }

  Future getDepartmentsAll() async {
    try {
      LoadingDialog.open(context);
      await context.read<WithdrawItemsController>().getDepartments();
      final listDeparments = context.read<WithdrawItemsController>().departments;
      if (!mounted) return;
      if (departmentId != null) {
        for (var i = 0; i < listDeparments!.length; i++) {
          if (listDeparments[i].id == departmentId) {
            selectDepartment = listDeparments[i];
          }
        }
      }
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final underlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.black, width: 1),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('เบิกพัสดุ'),
        actions: [
          GestureDetector(
            onTap: () async {
              if (selectDepartment != null) {
                final TextEditingController qty = TextEditingController();
                var result = await BarcodeScanner.scan(options: options);
                inspect(result);
                if (result.rawContent != '') {
                  try {
                    final item = await WithdrawItemsService.searchBarCode(barcode: result.rawContent, department: selectDepartment!.id!);
                    if (item != null) {
                      final addItem = AddItem(
                        item: item,
                        qty: qty,
                        totalPrice: null,
                      );
                      docScan.add(addItem);
                      setState(() {});
                    }
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
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialogYes(
                    title: 'แจ้งเตือน',
                    description: 'กรุณาเลือกแผนก',
                    pressYes: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                'assets/icons/5393325.png',
                scale: 15,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'แผนก',
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Consumer<WithdrawItemsController>(
                builder: (BuildContext context, controller, child) {
                  return controller.departments?.isEmpty ?? true
                      ? SizedBox.shrink()
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          padding: EdgeInsets.all(8),
                          child: DropdownSearch<Department>(
                            selectedItem: selectDepartment,
                            items: controller.departments!,
                            itemAsString: (item) => item.name ?? '',
                            popupProps: PopupProps.dialog(
                              showSearchBox: true,
                              fit: FlexFit.loose,
                              dialogProps: DialogProps(
                                backgroundColor: Color.fromARGB(243, 202, 202, 202),
                              ),
                              containerBuilder: (context, popupWidget) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.grey, width: 3),
                                ),
                                child: popupWidget,
                              ),
                              searchFieldProps: TextFieldProps(
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  // fontFamily: 'Prompt',
                                ),
                                decoration: InputDecoration(
                                  hintText: 'ค้นหารายการ',
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 73, 73, 73)),
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: Colors.black,
                                  enabledBorder: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                ),
                              ),
                              itemBuilder: (context, item, isSelected) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      thickness: 1.5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              baseStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                // fontFamily: 'Prompt',
                              ),
                              dropdownSearchDecoration: InputDecoration(
                                hintText: 'เลือกรายการ',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'Prompt',
                                ),
                                border: InputBorder.none,
                                suffixIconColor: Colors.grey,
                              ),
                            ),
                            onChanged: (value) async {
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                              selectDepartment = value;
                              await prefs.setInt('departmentId', value!.id!);
                            },
                          ),
                        );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'เพิ่มรายการ',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),

                  // SizedBox(
                  //   width: 15,
                  // ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     final TextEditingController qty = TextEditingController();
                  //     var result = await BarcodeScanner.scan(options: options);
                  //     inspect(result);
                  //     if (result.rawContent != '') {
                  //       try {
                  //         final item = await WithdrawItemsService.searchBarCode(barcode: result.rawContent);
                  //         final addItem = AddItem(
                  //           item: item,
                  //           qty: qty,
                  //           totalPrice: null,
                  //         );
                  //         docScan.add(addItem);
                  //         setState(() {});
                  //       } on ApiException catch (e) {
                  //         if (!mounted) return;
                  //         LoadingDialog.close(context);
                  //         showDialog(
                  //           context: context,
                  //           builder: (context) => AlertDialogYes(
                  //             title: 'แจ้งเตือน',
                  //             description: '$e',
                  //             pressYes: () {
                  //               if (e.toString() != 'Token is expire') {
                  //                 Navigator.pop(context);
                  //               } else {
                  //                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  //                   return Loginpage();
                  //                 }));
                  //               }
                  //             },
                  //           ),
                  //         );
                  //       }
                  //     }
                  //   },
                  //   child: Container(
                  //     height: size.height * 0.08,
                  //     padding: EdgeInsets.all(8),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Icon(
                  //           Icons.document_scanner_outlined,
                  //           color: Colors.black,
                  //         ),
                  //         Text(
                  //           'แสกนบาร์โค้ด',
                  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              docScan.isEmpty
                  ? Container(
                      height: size.height * 0.45,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'ไม่มีรายการ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    )
                  : Container(
                      height: size.height * 0.45,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              docScan.length,
                              (index) => Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.all(4),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kMainColor,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'รายการ: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                ),
                                                Text(
                                                  docScan[index].item?.sup_item?.name ?? '',
                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                                ),
                                              ],
                                            ),

                                            // Text(
                                            //   'ประเภท: ${docScan[index].sup_unit_id}',
                                            // ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'จำนวนเบิก:  ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (docScan[index].qty!.text.isNotEmpty) {
                                                      if (int.parse(docScan[index].qty!.text) > 1) {
                                                        final current = int.tryParse(docScan[index].qty!.text);
                                                        final newValue = current! - 1;
                                                        docScan[index].qty!.text = newValue.toString();
                                                        setState(() {
                                                          docScan[index].totalPrice = (int.parse(docScan[index].qty!.text) * int.parse(docScan[index].item!.sup_item!.price!));
                                                        });
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    width: size.width * 0.07,
                                                    height: size.width * 0.07,
                                                    decoration: BoxDecoration(color: Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(6)),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InputTextFormField(
                                                  controller: docScan[index].qty,
                                                  width: size.width * 0.2,
                                                  height: size.height * 0.05,
                                                  textAlign: TextAlign.center,
                                                  keyboardType: TextInputType.number,
                                                  hintText: 'จำนวน',
                                                  onChanged: (p0) {
                                                    setState(() {
                                                      docScan[index].totalPrice = (int.parse(p0 == "" ? '0' : p0) * int.parse(docScan[index].item!.sup_item!.price!));
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (docScan[index].qty!.text.isNotEmpty) {
                                                      final current = int.tryParse(docScan[index].qty!.text);
                                                      final newValue = current! + 1;
                                                      docScan[index].qty!.text = newValue.toString();
                                                      setState(() {
                                                        docScan[index].totalPrice = (int.parse(docScan[index].qty!.text) * int.parse(docScan[index].item!.sup_item!.price!));
                                                      });
                                                    } else {
                                                      const int newValue = 1;
                                                      docScan[index].qty!.text = newValue.toString();
                                                      setState(() {
                                                        docScan[index].totalPrice = (int.parse(docScan[index].qty!.text) * int.parse(docScan[index].item!.sup_item!.price!));
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: size.width * 0.07,
                                                    height: size.width * 0.07,
                                                    decoration: BoxDecoration(color: Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(6)),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'เหลือจำนวน: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                ),
                                                Text(
                                                  '${docScan[index].item?.stock_current_balance ?? '0'}',
                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'ราคาต่อหน่วย: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                ),
                                                Text(
                                                  '${docScan[index].item?.sup_item?.price}',
                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'ราคารวม: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                ),
                                                Text(
                                                  '${docScan[index].totalPrice ?? ''}',
                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              docScan.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Colors.red,
                                            ),
                                            child: Column(
                                              children: [Icon(Icons.remove)],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )).reversed.toList(),
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              InputTextFormField(
                controller: remark,
                width: double.infinity,
                hintText: 'รายละเอียด',
                keyboardType: TextInputType.text,
                height: size.height * 0.25,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final clearData = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'ยืนยันล้างข้อมูลรายการ ใช่หรือไม่?',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('ยกเลิก'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ],
                        );
                      });
                  if (clearData == true) {
                    setState(() {
                      selectDepartment = null;
                      docScan.clear();
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ล้างข้อมูล',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final withdraw = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'ยืนยันในตั้งเบิกรายการใหม่ ใช่ไหม?',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'ผู้เขียนรายการเบิกจะต้องตรวจสอบและแก้ไขรายการเบิกให้ถูกต้อง เพื่อให้สามารถยื่นขออนุมัติใหม่ได้อย่างเหมาะสมและมีโอกาสมากขึ้นในการได้รับการอนุมัติ',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('ยกเลิก'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                              },
                              child: Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ],
                        );
                      });
                  if (withdraw == true) {
                    try {
                      LoadingDialog.open(context);
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      final userID = prefs.getInt('userId');
                      for (var i = 0; i < docScan.length; i++) {
                        final add = SendItem(
                          sup_item_id: docScan[i].item!.sup_item_id,
                          sup_unit_id: docScan[i].item!.sup_item!.sup_unit_id,
                          volume: 1,
                          pack: 1,
                          qty: int.parse(docScan[i].qty!.text),
                          price_per_unit: int.parse(docScan[i].item!.sup_item!.price!),
                          price: docScan[i].totalPrice,
                          price_pay: docScan[i].totalPrice,
                          dept_current_balance: docScan[i].item!.dept_current_balance,
                          stock_current_balance: docScan[i].item!.stock_current_balance,
                        );
                        withdrawItemAPI.add(add);
                      }

                      final code = await WithdrawItemsService.addWinthdraw(
                        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        hr_ci_department_id: selectDepartment!.id!,
                        user_id: userID!,
                        sup_pr_use: '',
                        remark: remark.text,
                        sup_item_trans: withdrawItemAPI,
                      );
                      LoadingDialog.close(context);
                      final approved = await showDialog<String>(
                        barrierColor: Color.fromARGB(217, 158, 158, 158),
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 15),
                          ),
                          content: Text(
                            'ยืนยันเบิกพัสดุ',
                            style: TextStyle(fontSize: 12),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, 'cancel');
                              },
                              child: Text('ยกเลิกเบิก', style: TextStyle(color: Colors.red)),
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
                        await WithdrawItemsService.approvedWinthdraw(id: code.id.toString(), status: approved!);
                        LoadingDialog.close(context);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                      }
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
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.05,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: kCardWaitColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'เบิกพัสดุ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddItem {
  Item? item;
  TextEditingController? qty;
  int? totalPrice;

  AddItem({
    this.item,
    this.qty,
    this.totalPrice,
  });
}
