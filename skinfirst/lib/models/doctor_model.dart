import 'dart:convert';

class DoctorModel {
  final String id;
  final String name;
  final String email;
  final String title;
  final int yearsOfExperience;
  final String highestDegree;
  final String specialization;
  final String profile;
  final String highlight;
  final List<dynamic> appointments;
  final DateTime createdAt;
  final DateTime updatedAt;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.title,
    required this.yearsOfExperience,
    required this.highestDegree,
    required this.specialization,
    required this.profile,
    required this.highlight,
    required this.appointments,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      title: json['title'],
      yearsOfExperience: json['yearsOfExperience'],
      highestDegree: json['highestDegree'],
      specialization: json['specialization'],
      profile: json['profile'],
      highlight: json['highlight'],
      appointments: json['appointments'] ?? [],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'title': title,
      'yearsOfExperience': yearsOfExperience,
      'highestDegree': highestDegree,
      'specialization': specialization,
      'profile': profile,
      'highlight': highlight,
      'appointments': appointments,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}