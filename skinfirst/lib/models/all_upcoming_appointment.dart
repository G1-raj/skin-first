class AllUpcomingAppointment {
  final bool success;
  final List<UpcomingAppointment> data;
  final String message;

  AllUpcomingAppointment(
    {
      required this.success,
      required this.data,
      required this.message
    }
  );

  factory AllUpcomingAppointment.fromJson(Map<String, dynamic> json) {
    return AllUpcomingAppointment(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => UpcomingAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }
}

class UpcomingAppointment {

  final String id;
  final String patientId;
  final String doctorId;
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

  UpcomingAppointment({
    required this.id,
    required this.patientId,
    required this.doctorId,
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

  factory UpcomingAppointment.fromJson(Map<String, dynamic> json) {
    return UpcomingAppointment(
      id: json['_id'],
      patientId: json['patientId'],
      doctorId: json['doctorId'],
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
      'doctorId': doctorId,
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
    return 'UpcomingAppointmentModel(id: $id, patientId: $patientId, doctor: $doctorId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, patientDetails: $patientDetails, patientName: $patientName, patientAge: $patientAge, patientGender: $patientGender, problemDescription: $problemDescription, isPending: $isPending, isCancelled: $isCancelled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

}