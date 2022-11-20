class User{
  String? userId;
  String? name;
  String? token;

  User({required this.name, required this.userId, required this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['userId'] = userId;
    data['token'] = token;
    return data;
  }
}