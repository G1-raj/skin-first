import 'package:skinfirst/models/all_doctor_model.dart';
import 'package:skinfirst/models/all_upcoming_appointment.dart';
import 'package:skinfirst/models/appointment_response_model.dart';
import 'package:skinfirst/models/doctor_response_model.dart';
import 'package:skinfirst/models/error_response_model.dart';
import 'package:skinfirst/models/upcoming_appointment_response.dart';
import 'package:skinfirst/models/user_model.dart';

class ResponseModel {
  final bool isSuccess;
  final UserModel? authenticationResponse;
  final DoctorResponseModel? doctorResponse;
  final AllDoctorModel? allDoctorResponse;
  final AppointmentResponseModel? appointment;
  final UpcomingAppointmentResponse? upcomingappointment;
  final AllUpcomingAppointment? allupcomingAppointment;
  final ErrorResponseModel? errorResponse;

  ResponseModel.success(this.authenticationResponse) 
  : isSuccess = true, errorResponse = null, doctorResponse = null, allDoctorResponse = null, appointment = null, upcomingappointment = null, 
  allupcomingAppointment = null;

  ResponseModel.getDoctor(this.doctorResponse)
  : isSuccess = true, authenticationResponse = null, errorResponse = null, allDoctorResponse = null, appointment = null, upcomingappointment = null , 
  allupcomingAppointment = null;

  ResponseModel.getAllDoctor(this.allDoctorResponse)
  : isSuccess = true, authenticationResponse = null, errorResponse = null, doctorResponse = null, appointment = null, upcomingappointment = null, 
  allupcomingAppointment = null;

  ResponseModel.appointmentResponse(this.appointment)
  : isSuccess = true, authenticationResponse = null, errorResponse = null, doctorResponse = null, allDoctorResponse = null, upcomingappointment = null, 
  allupcomingAppointment = null;

  ResponseModel.upcomingappointmentresponse(this.upcomingappointment)
  : isSuccess = true, authenticationResponse = null, errorResponse = null, doctorResponse = null, allDoctorResponse = null, appointment = null, 
  allupcomingAppointment = null;

  ResponseModel.allupcomingappointmentresponse(this.allupcomingAppointment)
  : isSuccess = true, authenticationResponse = null, errorResponse = null, doctorResponse = null, allDoctorResponse = null, appointment = null, 
  upcomingappointment = null;

  ResponseModel.error(this.errorResponse) 
  : isSuccess = false, authenticationResponse = null, doctorResponse = null, allDoctorResponse = null, appointment = null, upcomingappointment = null, 
  allupcomingAppointment = null;

  
}