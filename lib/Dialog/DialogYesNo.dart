import 'package:flutter/material.dart';

class Dialogyesno extends StatefulWidget {
  const Dialogyesno({
    super.key,
    required this.description,
    required this.pressYes,
    required this.pressNo,
    InkWell? onTap,
    required this.title,
    required this.bottomNameYes,
    required this.bottomNameNo,
  });
  final String title, description, bottomNameYes, bottomNameNo;
  final VoidCallback? pressYes;
  final VoidCallback? pressNo;
  @override
  State<Dialogyesno> createState() => _DialogyesnoState();
}

class _DialogyesnoState extends State<Dialogyesno> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      content: Text(
        widget.description,
        style: TextStyle(fontSize: 12),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: widget.pressNo,
                child: Text(
                  widget.bottomNameNo,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: widget.pressYes,
              child: Text(
                widget.bottomNameYes,
                style: TextStyle(fontSize: 18, color: Colors.amber),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DialogDismiss extends StatefulWidget {
  const DialogDismiss({
    super.key,
    required this.description,
    required this.pressYes,
    required this.pressNo,
    InkWell? onTap,
    required this.title,
    required this.bottomNameYes,
    required this.bottomNameNo,
  });
  final String description, bottomNameYes, bottomNameNo;
  final VoidCallback? pressYes;
  final VoidCallback? pressNo;
  final RichText title;

  @override
  State<DialogDismiss> createState() => _DialogDismissState();
}

class _DialogDismissState extends State<DialogDismiss> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      title: widget.title,
      content: Text(
        widget.description,
        style: TextStyle(fontSize: 12),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: widget.pressNo,
                child: Text(
                  widget.bottomNameNo,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: widget.pressYes,
              child: Text(
                widget.bottomNameYes,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFD82E18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
