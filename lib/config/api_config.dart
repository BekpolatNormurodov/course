import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  // SharedPreferences key
  static const String _tokenKey = 'auth_token';

  // Base URL from .env
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://api.faksa.uz';

  // Get token from storage or use default
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final storedToken = prefs.getString(_tokenKey);

    if (storedToken != null && storedToken.isNotEmpty) {
      return storedToken;
    }

    // If no token in storage, just return default (don't save it)
    final defaultToken = dotenv.env['DEFAULT_TOKEN'] ?? '';
    return defaultToken;
  }

  // Save token to storage
  static Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_tokenKey, token);
  }

  // Delete token from storage
  static Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_tokenKey);
  }

  // Check if user is logged in (has token in storage, not default)
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final storedToken = prefs.getString(_tokenKey);
    return storedToken != null && storedToken.isNotEmpty;
  }

  // Headers with token from storage
  static Future<Map<String, String>> get headers async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Custom headers with different token
  static Map<String, String> headersWithToken(String token) => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  // Headers without Authorization (for public endpoints)
  static Map<String, String> get publicHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
