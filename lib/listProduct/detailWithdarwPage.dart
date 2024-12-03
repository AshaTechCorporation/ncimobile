import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/models/withdrawItem.dart';

class DetailWithdarwPage extends StatefulWidget {
  const DetailWithdarwPage({super.key, required this.data});
  final WithdrawItem data;

  @override
  State<DetailWithdarwPage> createState() => _DetailWithdarwPageState();
}

class _DetailWithdarwPageState extends State<DetailWithdarwPage> {
  String convertToBuddhistDate(DateTime date) {
    int buddhistYear = date.year + 543;
    return "${date.day}/${date.month}/$buddhistYear";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        title: Text('รายละเอียดการเบิก'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "เลขที่เบิก: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    widget.data.code ?? ' - ',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "วันที่เบิก: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    convertToBuddhistDate(DateTime.parse(widget.data.date!)),
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "ผู้เบิก: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    '${widget.data.user?.hr_employee?.fname ?? ' - '} ${widget.data.user?.hr_employee?.lname ?? ' - '}',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "สถานะ: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Container(
                    width: size.width * 0.3,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.data.approved == 'finish' ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Center(
                      child: Text(
                        widget.data.approved == 'finish' ? 'สำเร็จ' : 'รอยืนยันการเบิก',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "รายละเอียดการเบิก: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    '  ${widget.data.remark ?? ' - '}',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
              Text(
                'รายการเบิก:',
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(
                  widget.data.sup_item_trans!.length,
                  (index) => Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kMainColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            widget.data.sup_item_trans![index].sup_item?.image ?? '',
                            errorBuilder: (context, error, stackTrace) => Center(
                              child: Image.asset('assets/images/No_Image_Available.jpg'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'รายการ: ',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Text(
                                  widget.data.sup_item_trans![index].sup_item?.name ?? '',
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'จำนวนที่เบิก: ',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Text(
                                  '${widget.data.sup_item_trans![index].qty!.abs()}',
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                                Text(
                                  '  ${widget.data.sup_item_trans![index].sup_item?.sup_unit?.name ?? ''}',
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       'ราคาต่อหน่วย: ',
                            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            //     ),
                            //     Text(
                            //       '${docScan[index].item?.sup_item?.price}',
                            //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       'ราคารวม: ',
                            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            //     ),
                            //     Text(
                            //       '${docScan[index].totalPrice ?? ''}',
                            //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).reversed.toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
