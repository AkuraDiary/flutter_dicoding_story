class registerResponse {
  bool? error;
  String? message;

  registerResponse({this.error, this.message});

  registerResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}