import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zhouyi/models/divination_result.dart';

class DivinationService {
  static const String _baseUrl = 'http://www.zydx.win/@3.0/api.php';
  static const String _appId = '1751357082';
  static const String _appKey = '3cf993a74283b97ca06b554ffafc8ba7';

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
      'APPID': _appId,
      'APPKEY': _appKey,
      'api': '101',
      'name': name,
      'sex': sex.toString(),
      'DateType': '5',
      'InputDate': inputDate,
      if (city1 != null) 'city1': city1,
      if (city2 != null) 'city2': city2,
      if (city3 != null) 'city3': city3,
      if (sect != null) 'sect': sect.toString(),
      if (sylx != null) 'sylx': sylx.toString(),
      if (maxts != null) 'maxts': maxts.toString(),
      if (leixinggg != null) 'leixinggg': leixinggg,
      if (ztys != null) 'ztys': ztys.toString(),
      if (siling != null) 'siling': siling.toString(),
    };

    final uri = Uri.parse(_baseUrl).replace(queryParameters: queryParameters);
    
    if (kDebugMode) {
      print('--- DivinationService Request ---');
      print('GET $uri');
      print('-----------------------------');
    }

    try {
      final response = await http.get(uri);

      if (kDebugMode) {
        print('--- DivinationService Response ---');
        print('URL: ${response.request?.url}');
        print('Status Code: ${response.statusCode}');
        print('Body: ${utf8.decode(response.bodyBytes)}');
        print('--------------------------------');
      }

      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(utf8.decode(response.bodyBytes));
        if (decodedBody['code'] == 1) {
          return DivinationResult.fromJson(decodedBody['data']);
        } else {
          throw Exception('Failed to get divination result: ${decodedBody['msg']}');
        }
      } else {
        throw Exception('Failed to connect to divination service. Status code: ${response.statusCode}');
      }
    } catch (e, s) {
      if (kDebugMode) {
        print('--- DivinationService Error ---');
        print('Error on GET $uri: $e');
        print('Stacktrace: $s');
        print('-----------------------------');
      }
      rethrow;
    }
  }
  Future<String> getPaipanRawData({
    required String name,
    required int sex,
    required String inputDate,
    String? city1,
    String? city2,
    String? city3,
    int? sect,
    int? maxts,
    int? siling,
  }) async {
    final queryParameters = {
      'APPID': _appId,
      'APPKEY': _appKey,
      'api': '1', // 使用 api=1 获取原始数据
      'name': name,
      'sex': sex.toString(),
      'DateType': '5',
      'InputDate': inputDate,
      if (city1 != null) 'city1': city1,
      if (city2 != null) 'city2': city2,
      if (city3 != null) 'city3': city3,
      if (sect != null) 'sect': sect.toString(),
      if (maxts != null) 'maxts': maxts.toString(),
      if (siling != null) 'siling': siling.toString(),
    };

    final uri = Uri.parse(_baseUrl).replace(queryParameters: queryParameters);

    if (kDebugMode) {
      print('--- DivinationService Request ---');
      print('GET $uri');
      print('-----------------------------');
    }
    
    try {
      final response = await http.get(uri);

      if (kDebugMode) {
        print('--- DivinationService Response ---');
        print('URL: ${response.request?.url}');
        print('Status Code: ${response.statusCode}');
        print('Body: ${utf8.decode(response.bodyBytes)}');
        print('--------------------------------');
      }

      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes);
      } else {
        throw Exception('Failed to connect to divination service. Status code: ${response.statusCode}');
      }
    } catch (e, s) {
      if (kDebugMode) {
        print('--- DivinationService Error ---');
        print('Error on GET $uri: $e');
        print('Stacktrace: $s');
        print('-----------------------------');
      }
      rethrow;
    }
  }
}