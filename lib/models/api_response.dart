import 'package:flutter/foundation.dart';

/// API响应的通用包装类
/// [T] 是期望的数据类型
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? code;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.code,
  });

  /// 从JSON创建ApiResponse实例的工厂构造函数
  /// [fromJson] 是一个函数，用于将内部的 'data' JSON对象转换为类型 [T]
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJson) {
    return ApiResponse<T>(
      success: json['code'] == 200,
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? fromJson(json['data']) : null,
    );
  }
}

/// 用于表示没有特定返回数据的API响应
class EmptyData {
  EmptyData();
  static EmptyData fromJson(dynamic json) => EmptyData();
}