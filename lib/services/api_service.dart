import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:zhouyi/models/divination_result.dart';

class ApiService {
  // 现有占卜服务的配置
  static const String _divinationBaseUrl = 'http://www.zydx.win/@3.0/api.php';
  static const String _divinationAppId = '1751357082';
  static const String _divinationAppKey = '3cf993a74283b97ca06b554ffafc8ba7';

  // 新后端服务的配置
  static const String _backendBaseUrl = 'http://your.api.backend/api'; // TODO: 替换为真实的后端地址
  String? _token;

  /// 设置认证令牌
  void setAuthToken(String? token) {
    _token = token;
  }

  /// 构造带认证的请求头
  Map<String, String> _getHeaders() {
    final headers = {'Content-Type': 'application/json'};
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  /// 发送POST请求的辅助方法
  Future<Map<String, dynamic>> _post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_backendBaseUrl$endpoint'),
      headers: _getHeaders(),
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      // TODO: 更精细的错误处理
      throw Exception('Failed to post data to $endpoint. Status code: ${response.statusCode}');
    }
  }

  /// 发送GET请求的辅助方法
  Future<Map<String, dynamic>> _get(String endpoint, [Map<String, String>? queryParams]) async {
    final uri = Uri.parse('$_backendBaseUrl$endpoint').replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: _getHeaders());

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      // TODO: 更精细的错误处理
      throw Exception('Failed to get data from $endpoint. Status code: ${response.statusCode}');
    }
  }

  // --- 用户认证模块 ---

  /// 1.1 用户注册
  Future<Map<String, dynamic>> register({
    required String phone,
    required String password,
    required String birthDate,
    required String gender,
    required String verificationCode,
  }) async {
    return _post('/auth/register', {
      'phone': phone,
      'password': password,
      'birth_date': birthDate,
      'gender': gender,
      'verification_code': verificationCode,
    });
  }

  /// 1.2 用户登录
  Future<Map<String, dynamic>> login({
    required String phone,
    required String loginType,
    String? password,
    String? verificationCode,
  }) async {
    final data = {
      'phone': phone,
      'login_type': loginType,
    };
    if (password != null) {
      data['password'] = password;
    }
    if (verificationCode != null) {
      data['verification_code'] = verificationCode;
    }
    return _post('/auth/login', data);
  }

  /// 1.3 忘记密码
  Future<Map<String, dynamic>> resetPassword({
    required String phone,
    required String newPassword,
    required String confirmPassword,
    required String verificationCode,
  }) async {
    return _post('/auth/reset-password', {
      'phone': phone,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
      'verification_code': verificationCode,
    });
  }

  /// 1.4 发送验证码
  Future<Map<String, dynamic>> sendSms({
    required String phone,
    required String type,
  }) async {
    return _post('/auth/send-sms', {
      'phone': phone,
      'type': type,
    });
  }


  /// 发送PUT请求的辅助方法
  Future<Map<String, dynamic>> _put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_backendBaseUrl$endpoint'),
      headers: _getHeaders(),
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      // TODO: 更精细的错误处理
      throw Exception('Failed to put data to $endpoint. Status code: ${response.statusCode}');
    }
  }

  // --- 用户信息管理模块 ---

  /// 2.1 获取用户信息
  Future<Map<String, dynamic>> getUserProfile() async {
    return _get('/user/profile');
  }

  /// 2.2 更新用户信息
  Future<Map<String, dynamic>> updateUserProfile({
    String? nickname,
    String? avatar,
  }) async {
    final data = <String, dynamic>{};
    if (nickname != null) data['nickname'] = nickname;
    if (avatar != null) data['avatar'] = avatar;
    return _put('/user/profile', data);
  }

  /// 2.3 绑定支付宝/实名认证
  Future<Map<String, dynamic>> bindAlipay({
    required String realName,
    required String idCard,
    required String alipayAccount,
  }) async {
    return _post('/user/bind-alipay', {
      'real_name': realName,
      'id_card': idCard,
      'alipay_account': alipayAccount,
    });
  }

  /// 发送DELETE请求的辅助方法
  Future<Map<String, dynamic>> _delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$_backendBaseUrl$endpoint'),
      headers: _getHeaders(),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // DELETE请求可能返回空响应体，或者不返回JSON
      final responseBody = utf8.decode(response.bodyBytes);
      if (responseBody.isNotEmpty) {
        return jsonDecode(responseBody);
      }
      return {'code': response.statusCode, 'message': 'Success'};
    } else {
      // TODO: 更精细的错误处理
      throw Exception('Failed to delete resource at $endpoint. Status code: ${response.statusCode}');
    }
  }

  // --- 占卜服务模块 ---

  /// 3.1 八字排盘 (新后端)
  Future<Map<String, dynamic>> baziCalculate({
    required String name,
    required int gender, // 1-男, 0-女
    required String birthDatetime,
    required String birthLocation,
  }) async {
    return _post('/divination/bazi', {
      'name': name,
      'gender': gender,
      'birth_datetime': birthDatetime,
      'birth_location': birthLocation,
    });
  }

  /// 3.2 保存排盘记录
  Future<Map<String, dynamic>> saveDivinationRecord({
    required String name,
    required String gender,
    required String birthDatetime,
    required Map<String, dynamic> resultData,
  }) async {
    return _post('/divination/save-record', {
      'name': name,
      'gender': gender,
      'birth_datetime': birthDatetime,
      'result_data': resultData,
    });
  }

  /// 3.3 获取排盘历史
  Future<Map<String, dynamic>> getDivinationHistory({
    int page = 1,
    int limit = 20,
  }) async {
    return _get('/divination/history', {
      'page': page.toString(),
      'limit': limit.toString(),
    });
  }

  /// 3.4 删除排盘记录
  Future<Map<String, dynamic>> deleteDivinationRecord(int recordId) async {
    return _delete('/divination/record/$recordId');
  }

  // --- 问答系统模块 ---

  /// 4.1 发起新问询
  Future<Map<String, dynamic>> createQuestion({
    required String title,
    required String questionType,
    required Map<String, dynamic> birthInfo,
    required List<Map<String, dynamic>> questions,
    required double rewardAmount,
  }) async {
    return _post('/qa/create-question', {
      'title': title,
      'question_type': questionType,
      'birth_info': birthInfo,
      'questions': questions,
      'reward_amount': rewardAmount,
    });
  }

  /// 4.2 获取我的问询
  Future<Map<String, dynamic>> getMyQuestions({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    final params = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (status != null) {
      params['status'] = status;
    }
    return _get('/qa/my-questions', params);
  }

  /// 4.3 获取问询详情
  Future<Map<String, dynamic>> getQuestionDetails(int questionId) async {
    return _get('/qa/question/$questionId');
  }

  /// 4.4 回答问询
  Future<Map<String, dynamic>> answerQuestion({
    required int questionId,
    required List<Map<String, dynamic>> answers,
  }) async {
    return _post('/qa/answer', {
      'question_id': questionId,
      'answers': answers,
    });
  }

  /// 4.5 采纳答案
  Future<Map<String, dynamic>> adoptAnswer({
    required int questionId,
    required int answerId,
  }) async {
    return _post('/qa/adopt-answer', {
      'question_id': questionId,
      'answer_id': answerId,
    });
  }

  // --- 一对一咨询模块 ---

  /// 5.1 获取学者列表 (新后端)
  Future<Map<String, dynamic>> getScholars({
    int page = 1,
    int limit = 20,
    String? specialty,
  }) async {
    final params = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (specialty != null) {
      params['specialty'] = specialty;
    }
    return _get('/consultation/scholars', params);
  }

  /// 5.2 发起一对一咨询 (新后端)
  Future<Map<String, dynamic>> createNewConsultation({
    required int scholarId,
    required String consultationType,
    required Map<String, dynamic> birthInfo,
    required List<Map<String, dynamic>> questions,
  }) async {
    return _post('/consultation/create', {
      'scholar_id': scholarId,
      'consultation_type': consultationType,
      'birth_info': birthInfo,
      'questions': questions,
    });
  }

  /// 5.3 获取咨询历史 (新后端)
  Future<Map<String, dynamic>> getNewConsultationHistory({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    final params = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (status != null) {
      params['status'] = status;
    }
    return _get('/consultation/history', params);
  }

  // --- VIP会员模块 ---

  /// 6.1 获取VIP信息
  Future<Map<String, dynamic>> getVipInfo() async {
    return _get('/vip/info');
  }

  /// 6.2 购买VIP
  Future<Map<String, dynamic>> purchaseVip({
    required String packageType,
    required String paymentMethod,
  }) async {
    return _post('/vip/purchase', {
      'package_type': packageType,
      'payment_method': paymentMethod,
    });
  }

  // --- 支付模块 ---

  /// 7.1 创建支付订单
  Future<Map<String, dynamic>> createPaymentOrder({
    required String orderType,
    required double amount,
    required String paymentMethod,
    required int relatedId,
  }) async {
    return _post('/payment/create-order', {
      'order_type': orderType,
      'amount': amount,
      'payment_method': paymentMethod,
      'related_id': relatedId,
    });
  }

  // 7.2 支付回调: 通常由后端处理，前端无需调用

  /// 7.3 获取消费记录
  Future<Map<String, dynamic>> getConsumptionHistory({
    int page = 1,
    int limit = 20,
  }) async {
    return _get('/payment/consumption-history', {
      'page': page.toString(),
      'limit': limit.toString(),
    });
  }

  // --- 消息系统模块 ---

  /// 8.1 获取消息列表
  Future<Map<String, dynamic>> getMessages({
    int page = 1,
    int limit = 20,
    String? type,
  }) async {
    final params = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (type != null) {
      params['type'] = type;
    }
    return _get('/message/list', params);
  }

  /// 8.2 标记消息已读
  Future<Map<String, dynamic>> readMessage(int messageId) async {
    return _put('/message/$messageId/read', {});
  }

  /// 8.3 发送系统消息 (管理员功能)
  Future<Map<String, dynamic>> sendSystemMessage({
    List<int>? userIds,
    required String title,
    required String content,
    required String type,
  }) async {
    return _post('/message/send', {
      'user_ids': userIds,
      'title': title,
      'content': content,
      'type': type,
    });
  }

  // --- 反馈建议模块 ---

  /// 9.1 提交反馈
  Future<Map<String, dynamic>> submitFeedback({
    required String type,
    required String content,
    String? contactInfo,
    List<String>? images,
  }) async {
    return _post('/feedback/submit', {
      'type': type,
      'content': content,
      'contact_info': contactInfo,
      'images': images,
    });
  }

  /// 9.2 提交个人意见
  Future<Map<String, dynamic>> submitOpinion({
    required String opinion,
  }) async {
    return _post('/user/opinion', {
      'opinion': opinion,
    });
  }

  // --- 系统管理模块 ---

  /// 10.1 获取版本信息
  Future<Map<String, dynamic>> getVersionInfo() async {
    return _get('/system/version');
  }

  /// 10.2 检查更新
  Future<Map<String, dynamic>> checkUpdate() async {
    return _get('/system/check-update');
  }

  /// 获取八字排盘结果
  ///
  /// 必填参数:
  /// - [name]: 测算名称
  /// - [sex]: 性别 (0为男，1为女)
  /// - [inputDate]: 日期排盘日期，格式如：公历2023年11月2日 06时5分
  ///
  /// 可选参数:
  /// - [city1]: 真太阳时省地区
  /// - [city2]: 真太阳时市地区 (传入city1时必填)
  /// - [city3]: 真太阳时县地区 (传入city2时必填)
  /// - [sect]: 晚子时规则 (1为按明天，2为按当天，默认为2)
  /// - [sylx]: 1为启用流月
  /// - [maxts]: 指定获取几轮大运 (1-10)
  /// - [leixinggg]: 类型标识，通常为'on'
  /// - [ztys]: 真太阳时标识，通常为1
  /// - [siling]: 四柱信息标识，通常为0
  Future<DivinationResult> getDivinationResult({
    required String name,
    required int sex,
    required String inputDate,
    String? city1,
    String? city2,
    String? city3,
    int? sect,
    int? sylx,
    int? maxts,
    String? leixinggg,
    int? ztys,
    int? siling,
  }) async {
    final queryParameters = {
      'APPID': _divinationAppId,
      'APPKEY': _divinationAppKey,
      'api': '101',
      'name': name,
      'sex': sex.toString(),
      'DateType': '5',
      'inputdate': inputDate,
    };

    // Add optional parameters if provided
    if (city1 != null) queryParameters['city1'] = city1;
    if (city2 != null) queryParameters['city2'] = city2;
    if (city3 != null) queryParameters['city3'] = city3;
    if (sect != null) queryParameters['Sect'] = sect.toString();
    if (sylx != null) queryParameters['SYLX'] = sylx.toString();
    if (maxts != null) queryParameters['maxts'] = maxts.toString();
    if (leixinggg != null) queryParameters['leixinggg'] = leixinggg;
    if (ztys != null) queryParameters['ztys'] = ztys.toString();
    if (siling != null) queryParameters['Siling'] = siling.toString();

    final uri = Uri.parse(_divinationBaseUrl).replace(queryParameters: queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // Save the response to a file
      try {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/divination_response.json');
        // The response body is a string, so we need to decode it from UTF8
        // then re-encode it to a formatted JSON string.
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        final formattedJson = JsonEncoder.withIndent('  ').convert(jsonResponse);
        await file.writeAsString(formattedJson);
        print('Response saved to ${file.path}');
      } catch (e) {
        print('Error saving response: $e');
      }

      // 生成填充数据的HTML文件
      await _generateHtmlWithData(jsonDecode(utf8.decode(response.bodyBytes)));

      return divinationResultFromJson(response.body);
    } else {
      throw Exception('Failed to load divination result');
    }
  }

  /// 将API数据填充到HTML模板中
  Future<void> _generateHtmlWithData(Map<String, dynamic> apiData) async {
    try {
      // 读取HTML模板
      final String htmlTemplate = await rootBundle.loadString('assets/bazi_platform_files.html');

      // 提取API数据中的关键信息
      final data = apiData['data'];
      if (data == null) return;

      // 替换HTML中的数据
      String updatedHtml = htmlTemplate;

      // 基本信息替换
      final system = data['system'];
      if (system != null) {
        // 替换姓名
        if (system['name'] != null) {
          updatedHtml = updatedHtml.replaceAll('张三', system['name']);
        }

        // 替换性别
        if (system['sexx'] != null) {
          updatedHtml = updatedHtml.replaceAll('性别:男', '性别:${system['sexx']}');
        }

        // 替换生辰信息
        if (system['Z_QRQ'] != null) {
          updatedHtml = updatedHtml.replaceAll('阳历:2025年06月29日00时00分', '阳历:${system['Z_QRQ']}');
        }
      }

      // 八字信息替换
      final bz = data['BZ'];
      if (bz != null) {
        // 构建八字字符串
        final baziString = '${bz['ng']}${bz['nz']}  ${bz['yg']}${bz['yz']}  ${bz['rg']}${bz['rz']}  ${bz['sg']}${bz['sz']}';

        // 替换HTML中的八字信息
        updatedHtml = updatedHtml.replaceAll('乙巳  壬午  己巳  甲子', baziString);
        updatedHtml = updatedHtml.replaceAll('乙巳,壬午,己巳,甲子', '${bz['ng']}${bz['nz']},${bz['yg']}${bz['yz']},${bz['rg']}${bz['rz']},${bz['sg']}${bz['sz']}');

        // 替换标题中的八字
        updatedHtml = updatedHtml.replaceAll('乙巳 壬午 己巳 甲子', '${bz['ng']}${bz['nz']} ${bz['yg']}${bz['yz']} ${bz['rg']}${bz['rz']} ${bz['sg']}${bz['sz']}');
      }

      // 星座信息替换
      final xingzuo = data['XingZuo'];
      if (xingzuo != null && xingzuo['角色'] != null) {
        updatedHtml = updatedHtml.replaceAll('巨蟹座', xingzuo['角色']);
      }

      // 替换JavaScript数据
      if (data != null) {
        // 将完整的数据对象转换为JSON字符串并替换
        final jsonData = jsonEncode(data);
        // 查找并替换writeSource函数中的数据
        final writeSourcePattern = RegExp(r"writeSource\('','([^']+)'\);");
        updatedHtml = updatedHtml.replaceAllMapped(writeSourcePattern, (match) {
          return "writeSource('','$jsonData');";
        });
      }

      // 保存更新后的HTML文件
      final directory = await getApplicationDocumentsDirectory();
      final htmlFile = File('${directory.path}/bazi_result.html');
      await htmlFile.writeAsString(updatedHtml, encoding: utf8);

      debugPrint('HTML文件已生成: ${htmlFile.path}');

    } catch (e) {
      debugPrint('生成HTML文件失败: $e');
    }
  }

  /// 发起1v1咨询
  ///
  /// 参数:
  /// - [scholarId]: 学者ID
  /// - [consultationType]: 咨询类型 ('choice' 或 'essay')
  /// - [name]: 咨询者姓名
  /// - [gender]: 性别
  /// - [birthDateTime]: 生辰时间
  /// - [question]: 问题内容
  /// - [options]: 选择题选项 (仅选择题需要)
  Future<Map<String, dynamic>> createConsultation({
    required String scholarId,
    required String consultationType,
    required String name,
    required String gender,
    required String birthDateTime,
    required String question,
    List<String>? options,
  }) async {
    try {
      // 构建请求数据
      final requestData = {
        'scholar_id': scholarId,
        'consultation_type': consultationType,
        'birth_info': {
          'name': name,
          'gender': gender,
          'birth_datetime': birthDateTime,
        },
        'questions': [
          {
            'question': question,
            'type': consultationType,
            if (consultationType == 'choice' && options != null) 'options': options,
          }
        ],
      };

      // TODO: 这里应该调用实际的后端API
      // 目前返回模拟数据
      await Future.delayed(const Duration(seconds: 2)); // 模拟网络延迟

      // 模拟成功响应
      return {
        'code': 200,
        'message': '咨询发起成功',
        'data': {
          'consultation_id': DateTime.now().millisecondsSinceEpoch,
          'scholar_id': scholarId,
          'scholar_name': '学者${scholarId}',
          'price': 50.0,
          'status': 'pending',
          'created_at': DateTime.now().toIso8601String(),
        }
      };
    } catch (e) {
      if (kDebugMode) {
        print('创建咨询失败: $e');
      }
      rethrow;
    }
  }

  /// 获取学者列表
  Future<List<Map<String, dynamic>>> getScholarList({
    int page = 1,
    int limit = 20,
    String? specialty,
  }) async {
    try {
      // TODO: 这里应该调用实际的后端API
      // 目前返回模拟数据
      await Future.delayed(const Duration(seconds: 1)); // 模拟网络延迟

      return [
        {
          'id': '1',
          'name': '187****2568',
          'specialty': '八字分析',
          'price': 50.0,
          'rating': 4.8,
          'consultation_count': 1000,
        },
        {
          'id': '2',
          'name': '138****9999',
          'specialty': '风水命理',
          'price': 80.0,
          'rating': 4.9,
          'consultation_count': 800,
        },
        {
          'id': '3',
          'name': '159****1234',
          'specialty': '周易占卜',
          'price': 60.0,
          'rating': 4.7,
          'consultation_count': 1200,
        },
      ];
    } catch (e) {
      if (kDebugMode) {
        print('获取学者列表失败: $e');
      }
      rethrow;
    }
  }

  /// 获取咨询历史
  Future<Map<String, dynamic>> getConsultationHistory({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    try {
      // TODO: 这里应该调用实际的后端API
      // 目前返回模拟数据
      await Future.delayed(const Duration(seconds: 1)); // 模拟网络延迟

      return {
        'code': 200,
        'message': '获取成功',
        'data': {
          'consultations': [
            {
              'consultation_id': 123,
              'scholar_name': '187****2568',
              'consultation_type': 'choice',
              'price': 50.0,
              'status': 'completed',
              'created_at': '2025-01-01 10:00:00',
              'completed_at': '2025-01-01 11:00:00',
            },
            {
              'consultation_id': 124,
              'scholar_name': '138****9999',
              'consultation_type': 'essay',
              'price': 80.0,
              'status': 'pending',
              'created_at': '2025-01-02 14:00:00',
              'completed_at': null,
            },
          ],
          'total': 2,
          'page': page,
          'limit': limit,
        }
      };
    } catch (e) {
      if (kDebugMode) {
        print('获取咨询历史失败: $e');
      }
      rethrow;
    }
  }
}