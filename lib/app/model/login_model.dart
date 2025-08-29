class LoginResponse {
  final bool success;
  final String message;
  final String status;

  LoginResponse({
    required this.success,
    required this.message,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
