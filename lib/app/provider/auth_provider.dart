import 'package:flutter/material.dart';
import '../../backend/common/utils/http_handler.dart';
import '../model/login_model.dart';
import '../model/verify_otp_model.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  LoginResponse? loginResponse;
  VerifyOtpResponse? verifyOtpResponse;

  /// Login with phone number
  Future<void> login(String phone) async {
    isLoading = true;
    notifyListeners();

    loginResponse = await _apiService.loginUser(phone);

    isLoading = false;
    notifyListeners();
  }

  /// Verify OTP and store token + user
  Future<bool> verifyOtp(String phone, String otp) async {
    isLoading = true;
    notifyListeners();

    verifyOtpResponse = await _apiService.verifyOtp(phone, otp);

    if (verifyOtpResponse != null && verifyOtpResponse!.success) {
      // ✅ OTP verified successfully
      isLoading = false;
      notifyListeners();
      return true;
    } else {
      // ❌ OTP failed
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Logout from all devices
  Future<bool> logout() async {
    isLoading = true;
    notifyListeners();

    final success = await _apiService.logoutAll();

    isLoading = false;
    if (success) {
      // Clear local state
      loginResponse = null;
      verifyOtpResponse = null;
    }
    notifyListeners();

    return success;
  }
}
