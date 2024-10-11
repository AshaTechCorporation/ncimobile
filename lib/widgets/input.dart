import 'package:flutter/material.dart';

class InputTextFormField extends StatefulWidget {
  InputTextFormField({
    super.key,
    this.width,
    this.height,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.keyboardType,
    this.style,
    this.colorfill,
    this.validator,
  });

  double? width;
  double? height;
  TextEditingController? controller;
  String? hintText;
  Widget? prefixIcon;
  bool? obscureText;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextStyle? style;
  Color? colorfill;
  String? Function(String?)? validator;

  @override
  State<InputTextFormField> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? 250,
        height: widget.height ?? 60,
        child: TextFormField(
          controller: widget.controller,
          // onTap: () async {},
          style: TextStyle(fontSize: 22),
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            hintText: widget.hintText,
            hintStyle: widget.style,
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: widget.colorfill,
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          validator: widget.validator,
        ));
  }
}

class InputTextFormFieldPassword extends StatefulWidget {
  InputTextFormFieldPassword({super.key, this.width, this.height, this.controller, this.hintText, this.prefixIcon, required this.obscureText, this.suffixIcon, this.validator, this.keyboardType, this.colorfill, this.style});

  double? width;
  double? height;
  TextEditingController? controller;
  String? hintText;
  Widget? prefixIcon;
  bool obscureText = false;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  Color? colorfill;
  TextStyle? style;

  @override
  State<InputTextFormFieldPassword> createState() => _InputTextFormFieldPasswordState();
}

class _InputTextFormFieldPasswordState extends State<InputTextFormFieldPassword> {
  late bool _show = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
          controller: widget.controller,
          // onTap: () async {},
          style: TextStyle(fontSize: 22),
          obscureText: widget.obscureText ? _show : false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            hintText: widget.hintText,
            hintStyle: widget.style,
            suffixIcon: widget.obscureText
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _show = !_show;
                      });
                    },
                    child: _show ? Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye_outlined))
                : null,
            filled: true,
            fillColor: widget.colorfill,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          validator: widget.validator),
    );
  }
}
