class user{
  String? name;
  String? email;
  String? password;
  String? role;
  String? nib;
  String? nama_usaha;

  user({required this.name, required this.email, required this.password, required this.role});

  user.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}