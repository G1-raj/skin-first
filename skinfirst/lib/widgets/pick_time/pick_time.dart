import 'package:flutter/material.dart';

class PickTime extends StatefulWidget {
  final TextEditingController timeText; 
  const PickTime({super.key, required this.timeText});

  @override
  State<PickTime> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  TimeOfDay selectedTime = TimeOfDay.now(); // Store selected time

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

     widget.timeText.text = selectedTime.format(context);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize the text field with the current time
  //   widget.timeText.text = selectedTime.format(context);
  // }

  // Function to show Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        widget.timeText.text = selectedTime.format(context); // Update text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        readOnly: true,
        onTap: () => _selectTime(context),
        decoration: const InputDecoration(
          labelText: "Select Time",
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.access_time),
        ),
        controller: widget.timeText, // Use the passed controller
      ),
    );
  }
}
