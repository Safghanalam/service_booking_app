import 'package:flutter/material.dart';

import '../../backend/common/utils/http_handler.dart';
import '../model/login_model.dart';
import '../model/verify_otp_model.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  LoginResponse? loginResponse;
  VerifyOtpResponse? verifyOtpResponse;

  Future<void> login(String phone) async {
    isLoading = true;
    notifyListeners();

    loginResponse = await _apiService.loginUser(phone);

    isLoading = false;
    notifyListeners();
  }

  Future<void> verifyOtp(String phone, String otp) async {
    isLoading = true;
    notifyListeners();

    verifyOtpResponse = await _apiService.verifyOtp(phone, otp);

    isLoading = false;
    notifyListeners();
  }
}
