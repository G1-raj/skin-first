class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String? profilePicture;
  final String? profilePictureImageId;
  final String? password;
  final List<String>? appointments;
  final String createdAt;
  final String updatedAt;

  User(
    {
      required this.id,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      this.profilePicture,
      this.profilePictureImageId,
      this.password,
      this.appointments,
      required this.createdAt,
      required this.updatedAt
    }
  );

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'profilePicture': profilePicture,
      'profilePictureImageId': profilePictureImageId,
      'password': password,
      'appointments': appointments,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      profilePicture: json['profilePicture'],
      profilePictureImageId: json['profilePictureImageId'],
      password: json['password'],
      appointments: (json['appointments'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, phoneNo: $phoneNo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }


}