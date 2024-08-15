import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

class ListContentWidget extends StatelessWidget {
  const ListContentWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        news.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: Container(
            width: size.width * 0.98,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(news[index]['pic'], fit: BoxFit.fitHeight,),
                    )),
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${news[index]['title']}'), 
                      Text('${news[index]['subtitle']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),), 
                      Text('${news[index]['des']}', overflow: TextOverflow.ellipsis, maxLines: 2,),
              
                      SizedBox(
                        height: size.height * 0.01,
                      ),
              
                      Container(
                        height: size.height * 0.04,
                        width: size.width * 0.60,
                        color: Color.fromARGB(255, 221, 215, 215),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('อ่านรายละเอียดเพิ่มเติม'),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}