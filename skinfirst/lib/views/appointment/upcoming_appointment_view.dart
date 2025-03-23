import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/controllers/appointment_controller.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/controllers/doctor_controller.dart';
import 'package:skinfirst/widgets/upcoming_appointment_card/upcoming_appointment_card.dart';

class UpcomingAppointmentView extends StatelessWidget {
  UpcomingAppointmentView({super.key});

  final AppointmentController _appointmentController = Get.put(AppointmentController());
  final AuthController _authController = Get.put(AuthController());
  final DoctorController _doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {

    final patientId = _authController.user.value!.id;

     WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_appointmentController.allUpcomingAppointment.value == null) {
        _appointmentController.getAllUpcomingAppointmentController(patientId);

        _appointmentController.getUpcomingAppointmentDetailsController(patientId);
      }
    });

    return SafeArea(
      child: Obx(
       () {

        final upcomingAppointments = _appointmentController.allUpcomingAppointment.value;

        if(upcomingAppointments == null || upcomingAppointments.data.isEmpty) {
          return Center(
            child: Text("No upcoming appointment", style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
            ),),
          );
        }

         if(_appointmentController.allUpcomingAppointment.value != null) {
          _doctorController.getADoctorDetailController(_appointmentController.upcomingAppointment.value!.doctor.id);
        }

          return ListView.builder(
            itemCount: _appointmentController.allUpcomingAppointment.value!.data.length,
            itemBuilder: (context, index) => UpcomingAppointmentCard(
              appointmentId: _appointmentController.allUpcomingAppointment.value!.data[index].id,
              appointmentTime: _appointmentController.allUpcomingAppointment.value!.data[index].appointmentTime,
              appointmentDate: _appointmentController.allUpcomingAppointment.value!.data[index].appointmentDate,
              doctorName: _doctorController.doctorDetails.value!.name,
              highestQualification: _doctorController.doctorDetails.value!.highestDegree,
              specialization: _doctorController.doctorDetails.value!.specialization,
            ),
          );
        }
      ),
    );
  }
}