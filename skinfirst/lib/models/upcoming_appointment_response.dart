import 'package:skinfirst/models/upcoming_appointment_model.dart';

class UpcomingAppointmentResponse {
  final bool success;
  final UpcomingAppointmentModel data;
  final String message;

  UpcomingAppointmentResponse(
    {
      required this.success,
      required this.data,
      required this.message
    }
  );

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
      'message': message,
    };
  }

  factory UpcomingAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingAppointmentResponse(
      success: json['success'],
      data: UpcomingAppointmentModel.fromJson(json['data']),
      message: json['message'],
    );
  }
}