import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://farmapp.channab.com";

  Future<Map<String, dynamic>?> loginUser(String mobileNumber, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/accounts/api/login/'),
      body: {
        'username': mobileNumber,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Error logging in: ${response.statusCode}");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getHomeData(String token, String timeFilter) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/?time_filter=$timeFilter'),
      headers: {
        "Authorization": "Token $token"
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Error fetching home data: ${response.statusCode}");
      return null;
    }
  }
}
