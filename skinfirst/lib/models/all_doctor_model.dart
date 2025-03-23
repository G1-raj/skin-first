import 'package:skinfirst/models/doctor_model.dart';

class AllDoctorModel {
  final bool success;
  final List<DoctorModel> data;
  final String message;

  AllDoctorModel({
    required this.success,
    required this.data,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((doctor) => doctor.toJson()).toList(),
      'message': message,
    };
  }

  factory AllDoctorModel.fromJson(Map<String, dynamic> json) {
    return AllDoctorModel(
      success: json['success'],
      data: (json['data'] as List<dynamic>).map((item) => DoctorModel.fromJson(item)).toList(),
      message: json['message'],
    );
  }
}
