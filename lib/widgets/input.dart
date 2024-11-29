import 'package:flutter/material.dart';
import 'package:ncimobile/constants.dart';

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
    this.onChanged,
    this.textAlign,
  });

  double? width;
  double? height;
  TextEditingController? controller;
  String? hintText;
  Widget? prefixIcon;
  bool? obscureText;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  void Function(String)? onChanged;
  TextAlign? textAlign;

  @override
  State<InputTextFormField> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? 250,
        height: widget.height ?? 50,
        child: TextFormField(
          controller: widget.controller,
          textAlign: widget.textAlign ?? TextAlign.start,
          // onTap: () async {},
          onChanged: widget.onChanged,
          style: TextStyle(fontSize: 22),
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType,
          maxLines: widget.keyboardType == TextInputType.text ? 4 : 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 15),
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: Color.fromARGB(255, 240, 237, 237),
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
        ));
  }
}

class FromRegister extends StatefulWidget {
  FromRegister({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.icons,
    this.isPassword = false,
    this.readOnly = false,
    this.keyboardType,
    this.validator,
    this.width,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? icons;
  final bool isPassword;
  final bool readOnly;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final double? width;

  @override
  State<FromRegister> createState() => _FromRegisterState();
}

class _FromRegisterState extends State<FromRegister> {
  bool isObscureText = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 5),
            width: widget.width,
            child: TextFormField(
              maxLines: widget.keyboardType == TextInputType.multiline ? 5 : 1,
              // cursorColor: kPrimaryColor,
              controller: widget.controller,
              validator: widget.validator,
              readOnly: widget.readOnly,
              obscureText: widget.isPassword && !isObscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                prefixIcon: widget.icons,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey),
                // filled: true,
                // fillColor: Colors.grey[5],
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() => isObscureText = !isObscureText);
                        },
                        child: Icon(
                          !isObscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: kMainColor,
                        ),
                      )
                    : null,
              ),
              // validator: (String? value) {
              //   if (value!.isEmpty) {
              //     return 'กรุณากรอกชื่อผู้ใช้งาน';
              //   } else {
              //     return null;
              //   }
              // },
            )),
      ],
    );
  }
}
