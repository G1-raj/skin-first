import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/controllers/appointment_controller.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/controllers/doctor_controller.dart';
import 'package:skinfirst/widgets/cancelled_appointment_card/cancelled_appointment_card.dart';

class CancelledAppointmentView extends StatelessWidget {
  CancelledAppointmentView({super.key});

  final AppointmentController _appointmentController = Get.put(AppointmentController());
  final AuthController _authController = Get.put(AuthController());
  final DoctorController _doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {


    final patientId = _authController.user.value!.id;

     WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_appointmentController.allCancelledAppointment.value == null) {
        _appointmentController.getAllCancelledAppointmentsController(patientId);

        _appointmentController.getUpcomingAppointmentDetailsController(patientId);

        if(_appointmentController.allCancelledAppointment.value != null) {
          _doctorController.getADoctorDetailController(_appointmentController.upcomingAppointment.value!.doctor.id);
        }
      }
    });




    return SafeArea(
      child: Obx(
        () {

          final cancelledAppointments = _appointmentController.allCancelledAppointment.value;

          if(cancelledAppointments == null || cancelledAppointments.data.isEmpty) {
          return Center(
            child: Text("No upcoming appointment", style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
            ),),
          );
        }


          return ListView.builder(
            itemCount: _appointmentController.allCancelledAppointment.value!.data.length,
            itemBuilder: (context, index) => CancelledAppointmentCard(
              //  doctorName: "name",
              // highestQualification: "degree" ,
              // specialization: "specialization",
              doctorName: _doctorController.doctorDetails.value!.name,
              highestQualification:_doctorController.doctorDetails.value!.highestDegree ,
              specialization: _doctorController.doctorDetails.value!.specialization,
            ),
          );
        }
      ),
    );
  }
}