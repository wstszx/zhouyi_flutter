class User {
  final int id;
  final String phone;
  final String? nickname;
  final String? avatar;

  User({
    required this.id,
    required this.phone,
    this.nickname,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phone: json['phone'],
      nickname: json['nickname'],
      avatar: json['avatar'],
    );
  }
}

class AuthResponse {
  final String token;
  final User user;

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}