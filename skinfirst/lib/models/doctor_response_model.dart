import 'package:skinfirst/models/doctor_model.dart';

class DoctorResponseModel {
  final bool success;
  final DoctorModel data;
  final String message;

  DoctorResponseModel(
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

  factory DoctorResponseModel.fromJson(Map<String, dynamic> json) {
    return DoctorResponseModel(
      success: json['success'],
      data: DoctorModel.fromJson(json['data']),
      message: json['message'],
    );
  }
}