import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:zhouyi/models/divination_result.dart';

class ApiService {
  static const String _baseUrl = 'http://www.zydx.win/@3.0/api.php';
  static const String _appId = '1751357082';
  static const String _appKey = '3cf993a74283b97ca06b554ffafc8ba7';

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
      'APPID': _appId,
      'APPKEY': _appKey,
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

    final uri = Uri.parse(_baseUrl).replace(queryParameters: queryParameters);

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