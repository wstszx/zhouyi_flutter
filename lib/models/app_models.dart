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
  // ... 根据您的API响应定义字段
  final int id;
  final String title;
  Question({required this.id, required this.title});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(id: json['id'], title: json['title']);
  }
}

// --- Scholar Models ---
class Scholar {
  // ... 根据您的API响应定义字段
  final int id;
  final String name;
  Scholar({required this.id, required this.name});

  factory Scholar.fromJson(Map<String, dynamic> json) {
    return Scholar(id: json['id'], name: json['name']);
  }
}

// --- VIP Models ---
class VipInfo {
  // ... 根据您的API响应定义字段
  final bool isVip;
  final DateTime? expiryDate;
  VipInfo({required this.isVip, this.expiryDate});

  factory VipInfo.fromJson(Map<String, dynamic> json) {
    return VipInfo(
      isVip: json['is_vip'],
      expiryDate: json['expiry_date'] != null ? DateTime.parse(json['expiry_date']) : null,
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