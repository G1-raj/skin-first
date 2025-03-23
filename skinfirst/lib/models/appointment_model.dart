class AppointmentModel {

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
  final String createdAt;
  final String updatedAt;

  AppointmentModel(
    {
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
      required this.updatedAt
    }
  );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
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
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }


  @override
  String toString() {
    return 'AppointmentModel(id: $id, patientId: $patientId, doctorId: $doctorId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, patientDetails: $patientDetails, patientName: $patientName, patientAge: $patientAge, patientGender: $patientGender, problemDescription: $problemDescription, isPending: $isPending, isCancelled: $isCancelled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }


}
