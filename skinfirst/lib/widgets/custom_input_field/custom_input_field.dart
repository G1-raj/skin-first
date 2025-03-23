import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {

  final String title;
  final TextEditingController textController;
  bool? hidePassword;
  final String? Function(String?)? validator;
  final Function? onChanged;

  CustomInputField({super.key, required this.title, required this.textController, this.hidePassword = false, this.validator, this.onChanged});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  bool _hidePassword = false;

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.hidePassword ?? false;
  }
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: widget.validator,
      onChanged: widget.onChanged as void Function(String)?,
      style: TextStyle(color: Colors.black),
      obscureText: _hidePassword,
      decoration: InputDecoration(
      suffixIcon: widget.hidePassword == true
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
                child: Icon(
                  _hidePassword ? Icons.visibility : Icons.visibility_off,
                  color: appTheme,
                ),
              )
            : null,
        filled: true,
        fillColor: Color.fromRGBO(236, 241, 255, 1),
        labelText: widget.title,
        labelStyle: TextStyle(color: appTheme),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: appTheme, width: 2),
        ),
      ),
    );
  }
}