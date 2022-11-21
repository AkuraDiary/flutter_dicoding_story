import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../util/const.dart';
import '../../model/user_model.dart';
import '../responses/auth/login_response.dart';
import '../responses/auth/register_response.dart';

class ApiService {
  static Future<LoginResponse> doLoginUser(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(Const.loginUrl),
          body: {
            'email': email,
            'password': password,
          }
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      return loginResponse;
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  static Future<RegisterResponse> registerUser(String email, String password, String name) async {
    try {
      final response = await http.post(Uri.parse(Const.registerUrl),
          body: {
            'email': email,
            'password': password,
            'name': name,
          }
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      final RegisterResponse registerResponse = RegisterResponse.fromJson(responseData);
      return registerResponse;
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

}