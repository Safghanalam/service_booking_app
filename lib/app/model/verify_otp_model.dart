class VerifyOtpResponse {
  final bool success;
  final String message;
  final User? user;
  final String? token;
  final String? tokenType;

  VerifyOtpResponse({
    required this.success,
    required this.message,
    this.user,
    this.token,
    this.tokenType,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
      tokenType: json['token_type'],
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final int age;
  final String avatar;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.age,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age'] ?? 0,
      avatar: json['avatar'] ?? '',
    );
  }
}
