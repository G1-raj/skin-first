import 'dart:convert';

import 'package:skinfirst/constants.dart';
import 'package:http/http.dart' as http;
import 'package:skinfirst/models/all_upcoming_appointment.dart';
import 'package:skinfirst/models/appointment_response_model.dart';
import 'package:skinfirst/models/error_response_model.dart';
import 'package:skinfirst/models/response_model.dart';
import 'package:skinfirst/models/upcoming_appointment_response.dart';

class AppointmentService {
  
  Future<ResponseModel> makeAppointmentService(
    String patientId, String doctorId, String appointmentDate, String appointmentTime, String patientDetails, String patientName, int patientAge, String gender, String problemDescription
  ) async {

    try {

      var makeAppointmentUrl = Uri.parse(makeAppointment(patientId, doctorId));
      var response = await http.post(makeAppointmentUrl, body: jsonEncode({
          "appointmentDate": appointmentDate,
          "appointmentTime": appointmentTime,
          "patientDetails": patientDetails,
          "patientName": patientName,
          "patientAge": patientAge,
          "patientGender": gender,
          "problemDescription": problemDescription
        }),
      
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        }
      );

      var responseData = jsonDecode(response.body);


      if(response.statusCode  != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(responseData));
      }

      return ResponseModel.appointmentResponse(AppointmentResponseModel.fromJson(responseData));
      
    } catch (e) {
      throw Exception("Failed to make appointment error is in service module and error is: $e");
    }

  }

  Future<ResponseModel> getUpcomingAppointmentDetailsService(String patientId) async {
    try {

      var upcomingAppointmentUrl = Uri.parse(getUpcomingAppointmentDetails(patientId));
      var response = await http.get(upcomingAppointmentUrl, headers: {
         "Accept": "application/json",
         "Content-Type": "application/json",
      });

      var responseData = jsonDecode(response.body);

      if(response.statusCode != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(responseData));
      }

      return ResponseModel.upcomingappointmentresponse(UpcomingAppointmentResponse.fromJson(responseData));
      
    } catch (e) {
      throw Exception("Failed to get appointment error is in service module and error is: $e");
    }
  }

  Future<ResponseModel> getAllUpcomingAppointmentService(String patientId) async {
    try {

      var url = Uri.parse(getAllUpcomingAppointment(patientId));
      var response = await http.get(url, headers: {
         "Accept": "application/json",
         "Content-Type": "application/json",
      });

      var responseData = jsonDecode(response.body);

      if(response.statusCode != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(responseData));
      }

      return ResponseModel.allupcomingappointmentresponse(AllUpcomingAppointment.fromJson(responseData));
      
    } catch (e) {
      throw Exception("Failed to fetch all upcoming appointment's error is in service module and error is: $e");
    }
  }

  Future<ResponseModel> cancelAppointmentService(String appointmentId) async {
    try {

      var url = Uri.parse(cancelAppointment(appointmentId));
      var response = await http.patch(url, body: jsonEncode({}), headers: {
         "Accept": "application/json",
         "Content-Type": "application/json",
      });

      var responseData = jsonDecode(response.body);

      if(response.statusCode != 200) {
        ResponseModel.error(ErrorResponseModel.fromJson(responseData));
      }

      return ResponseModel.appointmentResponse(AppointmentResponseModel.fromJson(responseData));
      
      
    } catch (e) {
      throw Exception("Failed to cancel an appointment service error and error is: $e");
    }
  }

  Future<ResponseModel> getAllCancelledAppointmentsService(String patientId) async {
    try {

      var url = Uri.parse(getAllCancelledAppointments(patientId));
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      });
      

      var responseData = jsonDecode(response.body);

      if(response.statusCode != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(responseData));
      }

      return ResponseModel.allupcomingappointmentresponse(AllUpcomingAppointment.fromJson(responseData));
    } catch (e) {
      throw Exception("Failed to fetch all the cancelled appointments error is in service module and occured error is: $e");
    }
  }



}
