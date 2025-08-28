import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../app/model/login_model.dart';
import '../../../app/model/verify_otp_model.dart';
import 'constant.dart';

class ApiService {
  Future<LoginResponse?> loginUser(String phone) async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.userLogin}");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": "+91$phone"}),
      );

      print("📩 Request Body: ${jsonEncode({"phone": "+91$phone"})}");
      print("🌍 API URL: $url");
      print("📡 Response Code: ${response.statusCode}");
      print("📦 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponse.fromJson(data);
      } else {
        return LoginResponse(
          success: false,
          message: "Failed to login",
          status: "error",
        );
      }
    } catch (e) {
      return LoginResponse(
        success: false,
        message: e.toString(),
        status: "error",
      );
    }
  }

  Future<VerifyOtpResponse?> verifyOtp(String phone, String otp) async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.verifyOtp}");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone, "otp": otp}),
      );

      print("📩 Request Body: ${jsonEncode({"phone": phone, "otp": otp})}");
      print("🌍 API URL: $url");
      print("📡 Response Code: ${response.statusCode}");
      print("📦 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return VerifyOtpResponse.fromJson(data);
      } else if (response.statusCode == 302) {
        // 🚨 Redirect case
        print("⚠️ Got 302 Redirect. The server is redirecting instead of returning JSON.");
        return VerifyOtpResponse(
          success: false,
          message: "Server returned redirect instead of OTP verification response",
          user: null,
          token: null,
          tokenType: null,
        );
      } else {
        return VerifyOtpResponse(
          success: false,
          message: "Failed to verify OTP",
          user: null,
          token: null,
          tokenType: null,
        );
      }
    } catch (e) {
      return VerifyOtpResponse(
        success: false,
        message: e.toString(),
        user: null,
        token: null,
        tokenType: null,
      );
    }
  }

}
