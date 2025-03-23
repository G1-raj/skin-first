import 'package:get/get.dart';
import 'package:skinfirst/models/all_upcoming_appointment.dart';
import 'package:skinfirst/models/upcoming_appointment_model.dart';
import 'package:skinfirst/services/appointment_service.dart';

class AppointmentController extends GetxController {

  var upcomingAppointment = Rxn<UpcomingAppointmentModel>();
  var allUpcomingAppointment = Rxn<AllUpcomingAppointment>();
  var allCancelledAppointment = Rxn<AllUpcomingAppointment>();

  Future<void> makeAppointmentController(
     String patientId, String doctorId, String appointmentDate, String appointmentTime, String patientDetails, String patientName, int patientAge, String gender, String problemDescription
  ) async {

    try {


      var result = await AppointmentService().makeAppointmentService(
        patientId, doctorId, appointmentDate, appointmentTime, patientDetails, patientName, patientAge, gender, problemDescription
      );

      if(!result.isSuccess) {
        Get.snackbar("Error", result.errorResponse!.message);
        return;
      }

      Get.snackbar("Success", "Your appointment is booked");

      Get.offAllNamed("/home");
      
    } catch (e) {
      throw Exception("Failed to make appointment error is in controller module and error is: $e");
    }

  }

  Future<void> getUpcomingAppointmentDetailsController(String patientId) async {
    try {

      var result = await AppointmentService().getUpcomingAppointmentDetailsService(patientId);

      if(!result.isSuccess) {
        return;
      }

      

      upcomingAppointment.value = result.upcomingappointment!.data;
       
    } catch (e) {
      throw Exception("Failed to get appointment error is in controller module and error is: $e");
    }
  }

  Future<void> getAllUpcomingAppointmentController(String patientId) async {
    try {

      var result = await AppointmentService().getAllUpcomingAppointmentService(patientId);

      if(!result.isSuccess) {
        return;
      }

      allUpcomingAppointment.value = result.allupcomingAppointment;
      
    } catch (e) {
      throw Exception("Failed to get all upcoming appointment error is in controller module and error is: $e");
    }
  }

  Future<void> cancelAppointmentController(String appointmentId) async {
    try {

      var result = await AppointmentService().cancelAppointmentService(appointmentId);

      if(!result.isSuccess) {
        Get.snackbar("Error", "Failed to cancel an appointment");
      }

      Get.snackbar("Success", "Appointment is cancelled");

      Get.back();

      
      
    } catch (e) {
      throw Exception("Fail to cancel and appointment and error is in controller and error is: $e");
    }
  }


  Future<void> getAllCancelledAppointmentsController(String patientId) async {
    try {

      var result = await AppointmentService().getAllCancelledAppointmentsService(patientId);

      if(!result.isSuccess) {
        return;
      }

      allCancelledAppointment.value = result.allupcomingAppointment;
      
    } catch (e) {
      throw Exception("Failed to fetch all the cancelled appointment error is on controller module and error occured is: $e");
    }
  }


}