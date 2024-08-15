import 'package:flutter/material.dart';

class ContentProjectWidget extends StatelessWidget {
  const ContentProjectWidget({
    super.key,
    required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
        child: Text('$title'),
      ),
    );
  }
}