import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateCalender extends StatelessWidget {
  final TextEditingController dateText;
  const DateCalender({super.key, required this.dateText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Card(
        color: Color.fromRGBO(255, 255, 255, 1),
        elevation: 5,
        child: CalendarDatePicker(
          initialDate: DateTime.now(), 
          firstDate: DateTime.now(), 
          lastDate: DateTime(2030), 
          onDateChanged: (DateTime newDate) {
            dateText.text = DateFormat('yyyy-MM-dd').format(newDate);
          }
        ),
      ),
    );
  }
}