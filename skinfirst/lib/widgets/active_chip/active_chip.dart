import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';

class ActiveChip extends StatelessWidget {
  final IconData chipIcon;
  final String chipText;
  const ActiveChip({super.key, required this.chipIcon, required this.chipText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.03,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(chipIcon, color: appTheme),
            Text(chipText),
          ],
        ),
      ),
    );
  }
}