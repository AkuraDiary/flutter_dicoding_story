class BasicResponse {
  bool? error;
  String? message;

  BasicResponse({this.error, this.message});

  BasicResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}