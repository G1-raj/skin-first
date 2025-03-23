import 'package:skinfirst/models/user.dart';

class UserModel {
  final bool success;
  final User data;
  final String? token;
  final String message;

  UserModel(
    {
      required this.success,
      required this.data,
      this.token,
      required this.message
    }
  );

   Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
      'token': token,
      'message': message,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'],
      data: User.fromJson(json['data']),
      token: json['token'],
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'UserModel(success: $success, user: $data, token: $token, message: $message)';
  }
}