import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000";

  static Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    
    if (token != null) {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    }
    
    return {
      "Content-Type": "application/json",
    };
  }

  static Future<http.Response> get(String endpoint) async {
    final headers = await _getHeaders();
    final response = await http.get(Uri.parse("$baseUrl$endpoint"), headers: headers);
    
    _checkUnauthorized(response);
    return response;
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers,
      body: json.encode(body),
    );

    _checkUnauthorized(response);
    return response;
  }

  static void _checkUnauthorized(http.Response response) {
    if (response.statusCode == 401) {
      throw Exception("Unauthorized");
    }
  }
}
