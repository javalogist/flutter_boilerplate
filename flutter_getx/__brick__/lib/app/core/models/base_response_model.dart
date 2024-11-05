import 'package:flutter/material.dart';
import 'package:{{project_name}}/app/core/models/user_model.dart';

class BaseResponse<T, U> {
  final bool status;
  final String? message;
  final T? data;

  BaseResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json['status'] ?? false,
      message: json['message'],
      data: json['data'] != null ? _parseData<T, U>(json['data']) : null,
    );
  }

  factory BaseResponse.fromBaseJson(Map<String, dynamic>? json) {
    return BaseResponse(
      status: json != null,
      message: json != null ? "Success" : "Failure",
      data: json != null ? _parseData<T, U>(json) : null,
    );
  }

  static T _parseData<T, U>(dynamic jsonData) {
    if (jsonData is List) {
      // Handling the list case where T is a List<U>
      final list = jsonData
          .map((item) => _fromJsonSingle<U>(item))
          .where((item) => item != null)
          .cast<U>()
          .toList(); // Explicitly cast to List<U>
      return list as T; // Cast the final list to T
    } else {
      // Handling the single object case
      return _fromJsonSingle<U>(jsonData) as T;
    }
  }

  static U? _fromJsonSingle<U>(dynamic json) {
    // Create a mapping of types to constructors
    debugPrint("It is coming here as $U");
    final Map<Type, Function(dynamic)> typeMap = {
      UserModel: (json) => UserModel.fromJson(json),
      //Add other models here
    };

    final constructor = typeMap[U];
    if (constructor != null) {
      return constructor(json) as U;
    } else {
      debugPrint("Model not registered in the parser factory");
      return null;
    }
  }
}
