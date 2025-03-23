import 'package:skinfirst/models/appointment_model.dart';

class AppointmentResponseModel {
  final bool success;
  final AppointmentModel data;
  final String message;

  AppointmentResponseModel(
    {
      required this.success,
      required this.data,
      required this.message
    }
  );

   factory AppointmentResponseModel.fromJson(Map<String, dynamic> json) {
    return AppointmentResponseModel(
      success: json['success'],
      data: AppointmentModel.fromJson(json['data']),
      message: json['message'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
      'message': message,
    };
  }
}