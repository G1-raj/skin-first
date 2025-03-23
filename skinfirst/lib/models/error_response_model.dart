class ErrorResponseModel {
  final bool success;
  final String message;

  ErrorResponseModel(
    {
      required this.success,
      required this.message
    }
  );

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      success: json['success'],
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'ErrorResponseModel(success: $success, message: $message)';
  }
}