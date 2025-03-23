import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  const DateChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 6.0, left: 5.0, right: 2.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15, // Increased height
        width: MediaQuery.of(context).size.width * 0.12,  // Reduced width
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(50), // High border radius for capsule effect
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "25",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            // const SizedBox(height: 4),
            const Text(
              "Mon",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
