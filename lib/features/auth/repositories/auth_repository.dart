import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const String _baseUrl = 'https://api.bavoapp.in/api/v1';
  static const String _tokenKey = 'auth_token';

  Future<Map<String, dynamic>> signIn(String phone) async {
    try {
      print('🔵 SignIn Request: phone=$phone');
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/signIn'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone}),
      );

      print('🔵 SignIn Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        final error = jsonDecode(response.body);
        final message = error['message'] ?? 'Failed to send OTP';
        print('🔴 SignIn Error: $message');
        throw Exception(message);
      }
    } catch (e) {
      print('🔴 SignIn Exception: $e');
      if (e is Exception) rethrow;
      throw Exception('Network error. Please try again.');
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String phone, String otp) async {
    try {
      print('🔵 VerifyOtp Request: phone=$phone, otp=$otp');
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone, 'otp': otp}),
      );

      print('🔵 VerifyOtp Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        String? token;
        try {
          token = data['data']?['tokens']?['access']?['token'];
        } catch (e) {
          print('🔴 Token Extraction Error: $e');
        }

        if (token != null && token.isNotEmpty) {
          print('🟢 Token found: ${token.substring(0, 10)}...');
          await saveToken(token);

          if (data is Map<String, dynamic>) {
            data['token'] = token;
          }
        } else {
          print('🔴 Token NOT found in response');
        }

        return data;
      } else {
        final error = jsonDecode(response.body);
        final message = error['message'] ?? 'Invalid OTP';
        print('🔴 VerifyOtp Error: $message');
        throw Exception(message);
      }
    } catch (e) {
      print('🔴 VerifyOtp Exception: $e');
      if (e is Exception) rethrow;
      throw Exception('Network error. Please try again.');
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
