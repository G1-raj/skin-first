import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/appointment_controller.dart';
import 'package:skinfirst/helpers/format_date.dart';
import 'package:skinfirst/widgets/doctor_appointment_info/doctor_appointment_info.dart';

class ReviewAppointmentView extends StatelessWidget {
  ReviewAppointmentView({
    super.key,
  });


  final AppointmentController _appointmentController = Get.put(AppointmentController());



  

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args = Get.arguments ?? {};
    final String patientId = args['patientId'] ?? '';
    final String doctorId = args['doctorId'] ?? '';
    final String appointmentDate = args['appointmentDate'] ?? '';
    final String appointmentTime = args['appointmentTime'] ?? '';
    final String patientDetails = args['patientDetails'] ?? '';
    final String patientName = args['patientName'] ?? '';
    final int patientAge = int.tryParse(args['patientAge'].toString()) ?? 0;
    final String patientGender = args['patientGender'] ?? '';
    final String problemDescription = args['problemDescription'] ?? '';
    final bool isUpcoming = args['isUpcoming'] ?? true;

    final String dateFormat = formattoDesireDate(appointmentDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: appTheme),
        ),
        centerTitle: true,
        title: Text("Review Appointment", style: TextStyle(
          color: appTheme,
          fontWeight: FontWeight.bold
        ),),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                DoctorAppointmentInfo(
                  doctorId: doctorId,
                ),

                const SizedBox(height: 28,),

                Divider(
                  thickness: 3,
                  color: appTheme,
                  indent: MediaQuery.of(context).size.width * 0.1,
                  endIndent: MediaQuery.of(context).size.width * 0.1,
                ),

                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dateFormat, style: TextStyle(
                          color: appTheme,
                          fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 3,),
                        Text(appointmentTime, style: TextStyle(
                          color: appTheme,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Change", style: TextStyle(
                        color: appTheme
                      ),)
                    )
                  ],
                ),

                const SizedBox(height: 25,),

                Divider(
                  thickness: 3,
                  color: appTheme,
                  indent: MediaQuery.of(context).size.width * 0.1,
                  endIndent: MediaQuery.of(context).size.width * 0.1,
                ),

                const SizedBox(height: 25,),

                _infoRow("Booking For", patientDetails),
                _infoRow("Full Name", patientName),
                _infoRow("Age", "$patientAge"),
                _infoRow("Gender", patientGender),

                const SizedBox(height: 25,),

                Divider(
                  thickness: 3,
                  color: appTheme,
                  indent: MediaQuery.of(context).size.width * 0.1,
                  endIndent: MediaQuery.of(context).size.width * 0.1,
                ),

                const SizedBox(height: 25,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Text("Problem", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),

                const SizedBox(height: 5,),

                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: Text(problemDescription),
                ),

                const SizedBox(height: 12,),

                isUpcoming ? 
                ElevatedButton(
                  onPressed: () {
                    _appointmentController.makeAppointmentController(
                      patientId, 
                      doctorId, 
                      appointmentDate, 
                      appointmentTime, 
                      patientDetails, 
                      patientName, 
                      patientAge, 
                      patientGender, 
                      problemDescription
                    );

                    Get.offAllNamed("/home");
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appTheme
                  ),
                  child: Text("Confirm", style: TextStyle(color: Colors.white),)
                ) : Text(""),

              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _infoRow(String title, String value) {

    return Padding(
      padding: EdgeInsets.only(left: 48.0, right: 48.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title),
          Spacer(),
          Text(value),
        ],
      ),
    );

  }
}