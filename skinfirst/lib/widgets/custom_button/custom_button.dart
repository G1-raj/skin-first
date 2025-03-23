import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onClick;
  const CustomButton({super.key, required this.title, required this.buttonColor, required this.textColor, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
      ),
      child: Text(title, style: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}