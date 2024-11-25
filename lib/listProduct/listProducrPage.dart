import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';
import 'package:ncimobile/disbursement/widgets/HeadderDisburWidget.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ListProducrPage extends StatefulWidget {
  const ListProducrPage({super.key});

  @override
  State<ListProducrPage> createState() => _ListProducrPageState();
}

class _ListProducrPageState extends State<ListProducrPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          HeadderDisburWidget(
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
                        "รายการ",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหาโครงการ',
                      hintStyle: const TextStyle(fontSize: 14.0, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                      contentPadding: const EdgeInsets.all(5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SimpleBarcodeScannerPage(),
                              ));
                          setState(() {
                            if (res is String) {
                              // result = res;
                            }
                          });
                        },
                        child: Icon(
                          Icons.document_scanner_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: kMainColor, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              leading: Image.asset('assets/images/Frame1.png'),
                              title: Text('สินค้า'),
                              subtitle: Text('รายละเอียด'),
                              trailing: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
