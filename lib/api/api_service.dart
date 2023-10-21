import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://farmapp.channab.com"; // Replace with your API URL

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
      return null;
    }
  }
}
