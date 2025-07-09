// 为了简洁，将所有模型放在一个文件中
// 在大型项目中，建议将它们拆分到单独的文件中

// --- Fortune Models ---
class DivinationRecord {
  final int id;
  final String name;
  final String gender;
  final String birthDatetime;
  final Map<String, dynamic> resultData;

  DivinationRecord({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDatetime,
    required this.resultData,
  });

  factory DivinationRecord.fromJson(Map<String, dynamic> json) {
    return DivinationRecord(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      birthDatetime: json['birth_datetime'],
      resultData: json['result_data'],
    );
  }
}

// --- QA Models ---
class Question {
  final int id;
  final String title;
  final String status;
  final User? user;
  final String createdAt;
  final int answerCount;

  Question({
    required this.id,
    required this.title,
    required this.status,
    this.user,
    required this.createdAt,
    required this.answerCount,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      createdAt: json['created_at'],
      answerCount: json['answer_count'],
    );
  }
}

// --- Scholar Models ---
class Scholar {
  final int id;
  final String nickname;
  final String specialty;
  final double price;

  Scholar({
    required this.id,
    required this.nickname,
    required this.specialty,
    required this.price,
  });

  factory Scholar.fromJson(Map<String, dynamic> json) {
    return Scholar(
      id: json['id'],
      nickname: json['nickname'],
      specialty: json['specialty'],
      price: (json['price'] as num).toDouble(),
    );
  }
}

// --- VIP Models ---
class VipInfo {
  final bool isVip;
  final DateTime? expiryDate;
  final List<String> benefits;
  final double price;

  VipInfo({
    required this.isVip,
    this.expiryDate,
    required this.benefits,
    required this.price,
  });

  factory VipInfo.fromJson(Map<String, dynamic> json) {
    return VipInfo(
      isVip: json['is_vip'],
      expiryDate: json['expiry_date'] != null ? DateTime.parse(json['expiry_date']) : null,
      benefits: List<String>.from(json['benefits']),
      price: (json['price'] as num).toDouble(),
    );
  }
}

// --- System Models ---
class VersionInfo {
  // ... 根据您的API响应定义字段
  final String version;
  final String downloadUrl;
  VersionInfo({required this.version, required this.downloadUrl});

  factory VersionInfo.fromJson(Map<String, dynamic> json) {
    return VersionInfo(version: json['version'], downloadUrl: json['download_url']);
  }
}

// ... 为其他模块（如支付、消息等）添加更多模型

// --- User Model ---
class User {
  final String id;
  final String? phone;
  final String nickname;
  final String? avatar;

  User({
    required this.id,
    this.phone,
    required this.nickname,
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

// --- Auth Models ---
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