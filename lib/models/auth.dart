class Auth {
  String id;
  String email;
  String password;

  Auth({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class RefreshToken {
  final String? access;

  RefreshToken({required this.access});

  factory RefreshToken.fromJson(Map<String, dynamic> json) {
    return RefreshToken(access: json['access']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access'] = this.access;
    return data;
  }
}
