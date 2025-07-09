import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/paginated_response.dart';
import 'package:zhouyi/models/app_models.dart';

/// 自定义API异常类
class ApiError implements Exception {
  final String message;
  final int? code;
  final dynamic errorData;

  ApiError(this.message, {this.code, this.errorData});

  @override
  String toString() {
    return 'ApiError: $message (code: $code)';
  }
}

/// 环境配置
class Environment {
  static const String _devBaseUrl = 'http://192.168.1.6:5000/api/app';
  static const String _prodBaseUrl = 'https://api.yourdomain.com/api/app'; // 替换为您的生产环境域名

  static String get baseUrl {
    if (kReleaseMode) {
      return _prodBaseUrl;
    } else {
      return _devBaseUrl;
    }
  }
}

class ApiService {
  String? _token;
  late GlobalKey<NavigatorState> _navigatorKey;

  /// 设置NavigatorKey
  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  /// 设置认证令牌
  void setAuthToken(String? token) {
    _token = token;
  }

  /// 构造带认证的请求头
  Map<String, String> _getHeaders() {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  /// 处理HTTP响应
  ApiResponse<T> _handleResponse<T>(http.Response response, T Function(dynamic) fromJson) {
    final decodedBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final apiResponse = ApiResponse.fromJson(decodedBody, fromJson);
      if (apiResponse.success) {
        return apiResponse;
      } else {
        // 后端返回成功状态码，但业务逻辑失败
        throw ApiError(apiResponse.message ?? 'Unknown error', code: apiResponse.code);
      }
    }

    // 统一处理错误情况
    final errorMessage = decodedBody['message'] ?? 'Unknown server error';

    if (response.statusCode == 401) {
      // 根据错误信息判断是跳转还是提示
      // "用户已被禁用" 这类错误，不应该自动跳转到登录页，而是应该在UI层提示用户
      if (errorMessage != '用户已被禁用') {
        // 清除token并跳转到登录页
        setAuthToken(null);
        _navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
      }
      // 抛出异常，让UI层捕获并显示
      throw ApiError(errorMessage, code: response.statusCode, errorData: decodedBody);
    }

    // 其他HTTP错误
    throw ApiError(
      errorMessage,
      code: response.statusCode,
      errorData: decodedBody,
    );
  }

  /// 发送POST请求的辅助方法
  Future<ApiResponse<T>> _post<T>(String endpoint, T Function(dynamic) fromJson, {Map<String, dynamic>? data}) async {
    final uri = Uri.parse('${Environment.baseUrl}$endpoint');
    final headers = _getHeaders();
    final body = data != null ? jsonEncode(data) : null;

    if (kDebugMode) {
      print('--- ApiService Request ---');
      print('POST $uri');
      print('Headers: $headers');
      print('Body: $body');
      print('------------------------');
    }

    try {
      final response = await http.post(uri, headers: headers, body: body);
      if (kDebugMode) {
        print('--- ApiService Response ---');
        print('URL: ${response.request?.url}');
        print('Status Code: ${response.statusCode}');
        print('Body: ${utf8.decode(response.bodyBytes)}');
        print('-------------------------');
      }
      return _handleResponse(response, fromJson);
    } on SocketException {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Network error for POST $uri: SocketException');
        print('------------------------');
      }
      throw ApiError('Network error. Please check your connection.');
    } catch (e, s) {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Error on POST $uri: $e');
        print('Stacktrace: $s');
        print('------------------------');
      }
      rethrow;
    }
  }

  /// 发送GET请求的辅助方法
  Future<ApiResponse<T>> _get<T>(String endpoint, T Function(dynamic) fromJson, {Map<String, String>? queryParams}) async {
    final uri = Uri.parse('${Environment.baseUrl}$endpoint').replace(queryParameters: queryParams);
    final headers = _getHeaders();

    if (kDebugMode) {
      print('--- ApiService Request ---');
      print('GET $uri');
      print('Headers: $headers');
      print('------------------------');
    }

    try {
      final response = await http.get(uri, headers: headers);
      if (kDebugMode) {
        print('--- ApiService Response ---');
        print('URL: ${response.request?.url}');
        print('Status Code: ${response.statusCode}');
        print('Body: ${utf8.decode(response.bodyBytes)}');
        print('-------------------------');
      }
      return _handleResponse(response, fromJson);
    } on SocketException {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Network error for GET $uri: SocketException');
        print('------------------------');
      }
      throw ApiError('Network error. Please check your connection.');
    } catch (e, s) {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Error on GET $uri: $e');
        print('Stacktrace: $s');
        print('------------------------');
      }
      rethrow;
    }
  }

  /// 发送PUT请求的辅助方法
  Future<ApiResponse<T>> _put<T>(String endpoint, T Function(dynamic) fromJson, {Map<String, dynamic>? data}) async {
    final uri = Uri.parse('${Environment.baseUrl}$endpoint');
    final headers = _getHeaders();
    final body = data != null ? jsonEncode(data) : null;

    if (kDebugMode) {
      print('--- ApiService Request ---');
      print('PUT $uri');
      print('Headers: $headers');
      print('Body: $body');
      print('------------------------');
    }

    try {
      final response = await http.put(uri, headers: headers, body: body);
      if (kDebugMode) {
        print('--- ApiService Response ---');
        print('URL: ${response.request?.url}');
        print('Status Code: ${response.statusCode}');
        print('Body: ${utf8.decode(response.bodyBytes)}');
        print('-------------------------');
      }
      return _handleResponse(response, fromJson);
    } on SocketException {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Network error for PUT $uri: SocketException');
        print('------------------------');
      }
      throw ApiError('Network error. Please check your connection.');
    } catch (e, s) {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Error on PUT $uri: $e');
        print('Stacktrace: $s');
        print('------------------------');
      }
      rethrow;
    }
  }

  /// 发送DELETE请求的辅助方法
  Future<ApiResponse<T>> _delete<T>(String endpoint, T Function(dynamic) fromJson) async {
    final uri = Uri.parse('${Environment.baseUrl}$endpoint');
    final headers = _getHeaders();

    if (kDebugMode) {
      print('--- ApiService Request ---');
      print('DELETE $uri');
      print('Headers: $headers');
      print('------------------------');
    }

    try {
      final response = await http.delete(uri, headers: headers);
      if (kDebugMode) {
        print('--- ApiService Response ---');
        print('URL: ${response.request?.url}');
        print('Status Code: ${response.statusCode}');
        print('Body: ${utf8.decode(response.bodyBytes)}');
        print('-------------------------');
      }
      return _handleResponse(response, fromJson);
    } on SocketException {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Network error for DELETE $uri: SocketException');
        print('------------------------');
      }
      throw ApiError('Network error. Please check your connection.');
    } catch (e, s) {
      if (kDebugMode) {
        print('--- ApiService Error ---');
        print('Error on DELETE $uri: $e');
        print('Stacktrace: $s');
        print('------------------------');
      }
      rethrow;
    }
  }

  // --- 用户认证模块 ---

  Future<ApiResponse<AuthResponse>> register({required String phone, required String password, required String code}) async {
    return _post('/auth/register', (json) => AuthResponse.fromJson(json), data: {'phone': phone, 'password': password, 'code': code});
  }

  Future<ApiResponse<AuthResponse>> login({required String phone, String? password}) async {
    return _post('/auth/login', (json) => AuthResponse.fromJson(json), data: {'phone': phone, 'password': password});
  }

  Future<ApiResponse<EmptyData>> resetPassword({required String phone, required String password, required String code}) async {
    return _post('/auth/reset-password', (json) => EmptyData.fromJson(json), data: {'phone': phone, 'password': password, 'code': code});
  }

  Future<ApiResponse<EmptyData>> sendSms({required String phone, required String type}) async {
    return _post('/auth/send-code', (json) => EmptyData.fromJson(json), data: {'phone': phone, 'type': type});
  }

  // --- 用户信息管理模块 ---

  Future<ApiResponse<User>> getUserProfile() async {
    return _get('/user/profile', (json) => User.fromJson(json));
  }

  Future<ApiResponse<User>> updateUserProfile({String? nickname, String? avatar}) async {
    final data = <String, dynamic>{};
    if (nickname != null) data['nickname'] = nickname;
    if (avatar != null) data['avatar'] = avatar;
    return _put('/user/profile', (json) => User.fromJson(json), data: data);
  }

  Future<ApiResponse<EmptyData>> bindAlipay({required String realName, required String idCard, required String alipayAccount}) async {
    return _post('/user/bind-alipay', (json) => EmptyData.fromJson(json), data: {'real_name': realName, 'id_card': idCard, 'alipay_account': alipayAccount});
  }

  // --- 占卜服务模块 ---

  Future<ApiResponse<DivinationRecord>> baziCalculate({required String name, required int gender, required String birthDatetime, required String birthLocation}) async {
    return _post('/fortune/baZi', (json) => DivinationRecord.fromJson(json), data: {'name': name, 'gender': gender, 'birth_datetime': birthDatetime, 'birth_location': birthLocation});
  }

  Future<ApiResponse<DivinationRecord>> saveDivinationRecord({required String name, required String gender, required String birthDatetime, required Map<String, dynamic> resultData}) async {
    return _post('/fortune/baZi/save', (json) => DivinationRecord.fromJson(json), data: {'name': name, 'gender': gender, 'birth_datetime': birthDatetime, 'result_data': resultData});
  }

  Future<ApiResponse<PaginatedResponse<DivinationRecord>>> getDivinationHistory({int page = 1, int limit = 20}) async {
    return _get('/fortune/baZi/history', (json) => PaginatedResponse.fromJson(json, (itemJson) => DivinationRecord.fromJson(itemJson)), queryParams: {'page': page.toString(), 'limit': limit.toString()});
  }

  Future<ApiResponse<EmptyData>> deleteDivinationRecord(int recordId) async {
    return _delete('/fortune/baZi/$recordId', (json) => EmptyData.fromJson(json));
  }

  // --- 问答系统模块 ---

  Future<ApiResponse<Question>> createQuestion({required String title, required String questionType, required Map<String, dynamic> birthInfo, required List<Map<String, dynamic>> questions, required double rewardAmount}) async {
    return _post('/qa/ask', (json) => Question.fromJson(json), data: {'title': title, 'question_type': questionType, 'birth_info': birthInfo, 'questions': questions, 'reward_amount': rewardAmount});
  }

  Future<ApiResponse<PaginatedResponse<Question>>> getMyQuestions({int page = 1, int limit = 20, String? status}) async {
    final params = {'page': page.toString(), 'limit': limit.toString()};
    if (status != null) params['status'] = status;
    return _get('/qa/history', (json) => PaginatedResponse.fromJson(json, (itemJson) => Question.fromJson(itemJson)), queryParams: params);
  }

  Future<ApiResponse<Question>> getQuestionDetails(int questionId) async {
    return _get('/qa/$questionId', (json) => Question.fromJson(json));
  }

  Future<ApiResponse<EmptyData>> answerQuestion({required int questionId, required List<Map<String, dynamic>> answers}) async {
    return _post('/qa/answer/$questionId', (json) => EmptyData.fromJson(json), data: {'answers': answers});
  }

  Future<ApiResponse<EmptyData>> adoptAnswer({required int questionId, required int answerId}) async {
    return _post('/qa/adopt-answer', (json) => EmptyData.fromJson(json), data: {'questionId': questionId, 'answerId': answerId});
  }

  // --- 一对一咨询模块 ---

  Future<ApiResponse<PaginatedResponse<Scholar>>> getScholars({int page = 1, int limit = 20, String? specialty}) async {
    final params = {'page': page.toString(), 'limit': limit.toString()};
    if (specialty != null) params['specialty'] = specialty;
    return _get('/consult/scholars', (json) => PaginatedResponse.fromJson(json, (itemJson) => Scholar.fromJson(itemJson)), queryParams: params);
  }

  Future<ApiResponse<EmptyData>> createNewConsultation({required int scholarId, required String consultationType, required Map<String, dynamic> birthInfo, required List<Map<String, dynamic>> questions}) async {
    return _post('/consult/ask', (json) => EmptyData.fromJson(json), data: {'scholar_id': scholarId, 'consultation_type': consultationType, 'birth_info': birthInfo, 'questions': questions});
  }

  Future<ApiResponse<PaginatedResponse<dynamic>>> getNewConsultationHistory({int page = 1, int limit = 20, String? status}) async {
    final params = {'page': page.toString(), 'limit': limit.toString()};
    if (status != null) params['status'] = status;
    return _get('/consult/history', (json) => PaginatedResponse.fromJson(json, (itemJson) => itemJson), queryParams: params);
  }

  // --- VIP会员模块 ---

  Future<ApiResponse<VipInfo>> getVipInfo() async {
    return _get('/vip/status', (json) => VipInfo.fromJson(json));
  }

  Future<ApiResponse<EmptyData>> purchaseVip({required String packageType, required String paymentMethod}) async {
    return _post('/vip/order', (json) => EmptyData.fromJson(json), data: {'package_type': packageType, 'payment_method': paymentMethod});
  }

  // --- 支付模块 ---

  Future<ApiResponse<EmptyData>> createPaymentOrder({required String orderType, required double amount, required String paymentMethod, required int relatedId}) async {
    return _post('/payment/create-order', (json) => EmptyData.fromJson(json), data: {'orderType': orderType, 'amount': amount, 'paymentMethod': paymentMethod, 'relatedId': relatedId});
  }

  Future<ApiResponse<PaginatedResponse<dynamic>>> getConsumptionHistory({int page = 1, int limit = 20}) async {
    return _get('/payment/consumption-history', (json) => PaginatedResponse.fromJson(json, (itemJson) => itemJson), queryParams: {'page': page.toString(), 'limit': limit.toString()});
  }

  // --- 消息系统模块 ---

  Future<ApiResponse<PaginatedResponse<dynamic>>> getMessages({int page = 1, int limit = 20, String? type}) async {
    final params = {'page': page.toString(), 'limit': limit.toString()};
    if (type != null) params['type'] = type;
    return _get('/messages/list', (json) => PaginatedResponse.fromJson(json, (itemJson) => itemJson), queryParams: params);
  }

  Future<ApiResponse<EmptyData>> readMessage(int messageId) async {
    return _post('/messages/read/$messageId', (json) => EmptyData.fromJson(json));
  }

  Future<ApiResponse<EmptyData>> sendSystemMessage({List<String>? userIds, required String title, required String content, required String type}) async {
    return _post('/messages/send', (json) => EmptyData.fromJson(json), data: {'userIds': userIds, 'title': title, 'content': content, 'type': type});
  }

  // --- 反馈建议模块 ---

  Future<ApiResponse<EmptyData>> submitFeedback({required String type, required String content, String? contactInfo, List<String>? images}) async {
    return _post('/feedback/', (json) => EmptyData.fromJson(json), data: {'type': type, 'content': content, 'contact_info': contactInfo, 'images': images});
  }

  Future<ApiResponse<EmptyData>> submitOpinion({required String opinion}) async {
    return _post('/feedback/opinion', (json) => EmptyData.fromJson(json), data: {'opinion': opinion});
  }

  // --- 系统管理模块 ---

  Future<ApiResponse<VersionInfo>> getVersionInfo() async {
    return _get('/system/settings', (json) => VersionInfo.fromJson(json));
  }

  Future<ApiResponse<EmptyData>> checkUpdate() async {
    return _get('/system/health', (json) => EmptyData.fromJson(json));
  }
}