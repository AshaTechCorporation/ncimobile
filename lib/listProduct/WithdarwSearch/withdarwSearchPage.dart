import 'package:flutter/material.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/home/firstPage.dart';
import 'package:ncimobile/listProduct/Service/WithdrawItemsService.dart';
import 'package:ncimobile/models/withdrawItem.dart';

class WithdarwSearchPage extends StatefulWidget {
  const WithdarwSearchPage({super.key});

  @override
  State<WithdarwSearchPage> createState() => _WithdarwSearchPageState();
}

class _WithdarwSearchPageState extends State<WithdarwSearchPage> {
  FocusNode focusNode = FocusNode();
  List<WithdrawItem>? listWithdraws = [];
  @override
  void initState() {
    super.initState();
    listWithdraws?.clear();
    focusNode.requestFocus();
  }

  Future listProjects({String? status, String? perPage, String? page, String? search, String? page_type}) async {
    // final list = await context.read<ProjectController>().getProjects(status: status, perPage: perPage, page: page, search: search, page_type: page_type);
    final list = await WithdrawItemsService.getListWithdraw(search: search);
    setState(() {
      listWithdraws = list;
    });
  }

  String convertToBuddhistDate(DateTime date) {
    int buddhistYear = date.year + 543;
    return "${date.day}/${date.month}/$buddhistYear";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: TextFormField(
                focusNode: focusNode,
                onChanged: (value) {
                  if (value.length > 3) {
                    LoadingDialog.open(context);
                    listProjects(search: value);
                    LoadingDialog.close(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'ค้นหาโครงการ',
                  hintStyle: const TextStyle(fontSize: 14.0, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            listWithdraws?.isEmpty ?? true
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      'รายการ ${listWithdraws?.length ?? 0}',
                      style: TextStyle(fontSize: 25, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                    ),
                  ),
            listWithdraws?.isEmpty ?? true
                ? SizedBox(
                    width: double.infinity,
                    height: size.height * 0.7,
                    child: Center(
                      child: Text(
                        'ไม่พบรายการ',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: size.height * 0.7,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            listWithdraws!.length,
                            (index) {
                              return listWithdraws?[index].approved == 'cancel'
                                  ? SizedBox.shrink()
                                  : GestureDetector(
                                      onTap: () async {
                                        if (listWithdraws?[index].approved != 'finish' || listWithdraws?[index].approved == 'cancel') {
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
                                            await WithdrawItemsService.approvedWinthdraw(id: listWithdraws![index].id.toString(), status: approved!);
                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => FirstPage())), (route) => false);
                                            LoadingDialog.close(context);
                                          }
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
                                                      // ${DateTime.parse(listWithdraws![index].date!).formatTo('dd MMM yy')}
                                                      Text(
                                                        'เบิกวันที่:  ${convertToBuddhistDate(DateTime.parse(listWithdraws![index].date!))}',
                                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        'เลขที่ใบเบิก: ${listWithdraws?[index].code ?? ''}',
                                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: size.width * 0.3,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: listWithdraws?[index].approved == 'finish' ? Colors.green : Colors.red,
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
                                                            listWithdraws?[index].approved == 'finish' ? 'สำเร็จ' : 'รอยืนยันการเบิก',
                                                            style: TextStyle(color: Colors.white, fontSize: 12),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'ผู้เบิก: ${listWithdraws?[index].user?.hr_employee?.fname ?? ''}  ${listWithdraws?[index].user?.hr_employee?.lname ?? ''}',
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                'รายละเอียดการเบิก: ${listWithdraws?[index].remark ?? ' - '}',
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                    );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
