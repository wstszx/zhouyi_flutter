import 'dart:convert';
import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:zhouyi/models/divination_result.dart';

class ApiService {
  static const String _baseUrl = 'http://zydx.win/api.php';
  static const String _appId = '1751103945'; // Replace with your APPID
  static const String _appKey = '1dc133864f00b7ddce0c1bec5e75575b'; // Replace with your APPKEY

  Future<DivinationResult> getDivinationResult({
    required String name,
    required int sex,
    required String inputDate,
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

      return divinationResultFromJson(response.body);
    } else {
      throw Exception('Failed to load divination result');
    }
  }
}