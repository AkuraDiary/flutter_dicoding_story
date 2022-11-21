import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../util/const.dart';
import '../../model/user_model.dart';
import '../responses/auth/login_response.dart';

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

      // switch (response.statusCode) {
      //   case 200:
      //     final Map<String, dynamic> responseData = json.decode(response.body);
      //     final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      //     return loginResponse;
      //   case 400:
      //     final Map<String, dynamic> responseData = json.decode(response.body);
      //     final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      //     return loginResponse;
      //   case 401:
      //     final Map<String, dynamic> responseData = json.decode(response.body);
      //     final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      //     return loginResponse;
      //   case 500:
      //     final Map<String, dynamic> responseData = json.decode(response.body);
      //     final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      //     return loginResponse;
      //   default:
      //     final Map<String, dynamic> responseData = json.decode(response.body);
      //     final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      //     return loginResponse;
      // }
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

}