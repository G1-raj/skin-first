import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/widgets/calender/date_calender.dart';
import 'package:skinfirst/widgets/choice_chip/choice_chip.dart';
import 'package:skinfirst/widgets/custom_input_field/custom_input_field.dart';
import 'package:skinfirst/widgets/pick_time/pick_time.dart';

class BookAppointmentView extends StatelessWidget {
  BookAppointmentView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController problemDescriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController patientDetailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args = Get.arguments ?? {};
    String patientId = args['patientId'] ?? '';
    String doctorId = args['doctorId'] ?? '';


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: appTheme),
        ),
        title: Text(
          "Book Appointment",
          style: TextStyle(color: appTheme, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth * 0.85;
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DateCalender(
                          dateText: dateController,
                        ),
                        const SizedBox(height: 18),
                        Text("Select Time", style: TextStyle(color: appTheme, fontWeight: FontWeight.bold)),
                        PickTime(
                          timeText: timeController,
                        ),
                        const Text("Note: Lunch time from 1:00PM to 2:00PM"),
                        const SizedBox(height: 18),
                        Text("Patient details", style: TextStyle(color: appTheme, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        ChipsSelector(options: ["Yourself", "Another Person"], onSelected: (String choice) { patientDetailController.text = choice; }),
                        const SizedBox(height: 12),
                        CustomInputField(title: "Full Name", textController: nameController),
                        const SizedBox(height: 12,),
                        CustomInputField(title: "Age", textController: ageController),
                        const SizedBox(height: 18,),
                        Text("Gender", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        ChipsSelector(options: ["Male", "Female", "Other"], onSelected: (String choice) { genderController.text = choice;}),
                        const SizedBox(height: 18),
                        Divider(thickness: 3, color: appTheme, indent: width * 0.1, endIndent: width * 0.1),
                        const SizedBox(height: 28),
                        Text("Describe your problem", style: TextStyle(fontSize: 22, color: Colors.black)),
                        const SizedBox(height: 12),
                        Center(
                          child: SizedBox(
                            width: width,
                            child: TextField(
                              controller: problemDescriptionController,
                              maxLines: 10,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: "Describe your problem",
                                filled: true,
                                fillColor: subTheme,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 13),
                        Center(
                          child: SizedBox(
                            width: width * 0.7,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  Get.toNamed('/review_appointment', arguments: {
                                    "patientId": patientId,
                                    "doctorId": doctorId,
                                    "appointmentDate": dateController.text,
                                    "appointmentTime": timeController.text,
                                    "patientDetails": patientDetailController.text,
                                    "patientName": nameController.text,
                                    "patientAge": ageController.text,
                                    "patientGender": genderController.text,
                                    "problemDescription": problemDescriptionController.text,
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appTheme,
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text(
                                "Book appointment",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
