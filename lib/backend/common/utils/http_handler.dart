import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:service_booking_app_new/core/helpers.dart';

import '../../../app/model/login_model.dart';
import '../../../app/model/verify_otp_model.dart';
import 'constant.dart';

class ApiService {
  final helper = new Helpers();

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
        body: jsonEncode({"phone": "+91" + phone, "code": otp}),
      );

      print("📩 Request Body: ${jsonEncode({"phone": phone, "otp": otp})}");
      print("🌍 API URL: $url");
      print("📡 Response Code: ${response.statusCode}");
      print("📦 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await helper.saveSharedPreferences(
          key: "auth_token",
          value: data['token'],
        );

        await helper.saveSharedPreferences(
          key: "user",
          value: jsonEncode(data['user']),
        );

        final userToken = await helper.getSharedPreferences(key: "auth_token");
        final userData = await helper.getSharedPreferences(key: 'user');

        final userDataJson = jsonDecode(userData!);

        print(userDataJson['phone']);
        print("Final User Token : ${userToken}");

        return VerifyOtpResponse.fromJson(data);
      } else if (response.statusCode == 302) {
        // 🚨 Redirect case
        print(
          "⚠️ Got 302 Redirect. The server is redirecting instead of returning JSON.",
        );
        return VerifyOtpResponse(
          success: false,
          message:
              "Server returned redirect instead of OTP verification response",
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

  Future<bool> logoutAll() async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.logoutAll}");
      final token = await helper.getSharedPreferences(key: "auth_token");
      if (token == null || token.isEmpty) {
        print("⚠️ logoutAll: no token found in shared preferences. Clearing local auth and returning true.");
        await helper.clearAuthData(); // or delete keys individually
        return true;
      }

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("🌍 Logout API URL: $url");
      print("📡 Response Code: ${response.statusCode}");
      print("📦 Response Body: ${response.body}");

      // If server returned OK, treat as success and clear local store
      if (response.statusCode == 200) {
        await helper.clearAuthData();
        return true;
      }

      // If token invalid / already expired (401/403) — clear local auth anyway
      if (response.statusCode == 401 || response.statusCode == 403) {
        print("⚠️ Token invalid/expired — clearing local auth.");
        await helper.clearAuthData();
        return true;
      }

      // For any other error - don't remove local token automatically, but you can choose otherwise
      print("❌ logoutAll failed with status ${response.statusCode}");
      return false;
    } catch (e) {
      print("❌ logoutAll exception: $e");
      // In case of exception we might choose to clear local auth so user is forced to re-login:
      // await helper.clearAuthData();
      return false;
    }
  }

}
