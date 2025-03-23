class UpcomingAppointmentModel {
  final String id;
  final String patientId;
  final Doctor doctor;
  final String appointmentDate;
  final String appointmentTime;
  final String patientDetails;
  final String patientName;
  final int patientAge;
  final String patientGender;
  final String problemDescription;
  final bool isPending;
  final bool isCancelled;
  final DateTime createdAt;
  final DateTime updatedAt;

  UpcomingAppointmentModel({
    required this.id,
    required this.patientId,
    required this.doctor,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.patientDetails,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.problemDescription,
    required this.isPending,
    required this.isCancelled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UpcomingAppointmentModel.fromJson(Map<String, dynamic> json) {
    return UpcomingAppointmentModel(
      id: json['_id'],
      patientId: json['patientId'],
      doctor: Doctor.fromJson(json['doctorId']),
      appointmentDate: json['appointmentDate'],
      appointmentTime: json['appointmentTime'],
      patientDetails: json['patientDetails'],
      patientName: json['patientName'],
      patientAge: json['patientAge'],
      patientGender: json['patientGender'],
      problemDescription: json['problemDescription'],
      isPending: json['isPending'],
      isCancelled: json['isCancelled'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'patientId': patientId,
      'doctorId': doctor.toJson(),
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'patientDetails': patientDetails,
      'patientName': patientName,
      'patientAge': patientAge,
      'patientGender': patientGender,
      'problemDescription': problemDescription,
      'isPending': isPending,
      'isCancelled': isCancelled,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'UpcomingAppointmentModel(id: $id, patientId: $patientId, doctor: $doctor, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, patientDetails: $patientDetails, patientName: $patientName, patientAge: $patientAge, patientGender: $patientGender, problemDescription: $problemDescription, isPending: $isPending, isCancelled: $isCancelled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class Doctor {
  final String id;
  final String name;
  final String email;
  

  Doctor({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() => 'Doctor(id: $id, email: $email)';
}
