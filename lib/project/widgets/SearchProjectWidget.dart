import 'package:flutter/material.dart';

class SearchProjectWidget extends StatelessWidget {
  const SearchProjectWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ),
      ),
    );
  }
}