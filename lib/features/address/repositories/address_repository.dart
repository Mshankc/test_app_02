import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/address_model.dart';

class AddressRepository {
  static const String _baseUrl = 'https://api.bavoapp.in/api/v1';
  static const String _tokenKey = 'auth_token';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<List<AddressModel>> getAddresses() async {
    try {
      final headers = await _getHeaders();
      print('🔵 GET Request: $_baseUrl/addresses');
      print('🔵 Headers: $headers');

      final response = await http.get(
        Uri.parse('$_baseUrl/addresses'),
        headers: headers,
      );

      print('🟢 GET Response: ${response.statusCode}');
      print('🟢 Body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic decoded = jsonDecode(response.body);
        List<dynamic> data;

        if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
          data = decoded['data'];
        } else if (decoded is List) {
          data = decoded;
        } else {
          data = [];
        }

        return data
            .map((json) => AddressModel.fromJson(json))
            .where((address) => address.status != 'Delete')
            .toList();
      } else {
        throw Exception('Failed to load addresses: ${response.body}');
      }
    } catch (e) {
      print('🔴 GET Error: $e');
      return [];
    }
  }

  Future<void> saveAddress(AddressModel address) async {
    try {
      final headers = await _getHeaders();
      final url = Uri.parse('$_baseUrl/addresses');
      final body = jsonEncode(address.toJson());

      print('🔵 POST Request: $url');
      print('🔵 Body: $body');

      final response = await http.post(url, headers: headers, body: body);

      print('🟢 POST Response: ${response.statusCode}');
      print('🟢 Body: ${response.body}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        final error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Failed to add address');
      }
    } catch (e) {
      print('🔴 POST Error: $e');
      if (e is Exception) rethrow;
      throw Exception('Network error: $e');
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    // TODO: Implement update API when available
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> deleteAddress(String id) async {
    try {
      final headers = await _getHeaders();
      final url = Uri.parse('$_baseUrl/addresses/$id');

      print('🔵 DELETE Request: $url');
      print('🔵 Headers: $headers');

      final response = await http.delete(url, headers: headers);

      print('🟢 DELETE Response: ${response.statusCode}');
      print('🟢 Body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to delete address: ${response.statusCode} ${response.body}',
        );
      }

      // Check for soft failure in 200 OK response
      if (response.body.isNotEmpty) {
        try {
          final body = jsonDecode(response.body);
          if (body is Map<String, dynamic>) {
            if (body['success'] == false || body['status'] == 'error') {
              throw Exception(body['message'] ?? 'Server reported failure');
            }
          }
        } catch (_) {
          // Ignore decoding error if body is not JSON
        }
      }
    } catch (e) {
      print('🔴 DELETE Error: $e');
      if (e is Exception) rethrow;
      throw Exception('Network error: $e');
    }
  }
}
