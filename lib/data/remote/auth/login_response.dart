import '../../model/user_model.dart';

class loginResponse {
  bool? error;
  String? message;
  User? loginResult;

  loginResponse({this.error, this.message, this.loginResult});

 loginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    loginResult = json['loginResult'] != null
        ? User.fromJson(json['loginResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['message'] = message;
    if (loginResult != null) {
      data['loginResult'] = loginResult!.toJson();
    }
    return data;
  }
}
