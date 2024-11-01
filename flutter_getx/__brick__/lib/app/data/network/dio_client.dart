import 'dart:io';
import 'package:{{project_name}}/app/config/app_constants.dart';
import 'package:{{project_name}}/app/core/controllers/app_controller.dart';
import 'package:{{project_name}}/app/core/utils/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:{{project_name}}/app/config/environment.dart';
import 'package:{{project_name}}/app/data/network/api_client.dart';

class DioClient extends ApiClient {
  late final Dio _client;
  late final AppController appController;

  DioClient() {
    appController = Get.find<AppController>();
    final options = BaseOptions(
      baseUrl:
      "${Environment.baseUrl}/api/${Environment.version}/${Environment.service}",
      connectTimeout: Duration(
          seconds: int.tryParse(
              Environment.connectionTimeout ?? 'connectionTimeout') ??
              15),
      // Configure connect timeout
      receiveTimeout: Duration(
          seconds:
          int.tryParse(Environment.receiveTimeout ?? 'receiveTimeout') ??
              10),
      headers: {
        'Content-Type': contentType,
        'Accept': accept,
      },
    );

    _client = Dio(options);

    // Adding interceptors
    _client.interceptors.addAll([
      _headerInterceptor(), // Add request headers
      _logInterceptor(), // Log request/response
      _responseInterceptors(),
      _errorInterceptor(), // Error handling
    ]);
  }

// Request Interceptor to modify headers or add additional information
  InterceptorsWrapper _headerInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // List of endpoints where you want to exclude the JWT token
        List<String> excludedEndpoints = [
          '/getOtp', // Add your endpoint paths here
        ];

        // Check if the request path contains any excluded endpoints
        if (excludedEndpoints
            .any((endpoint) => options.path.contains(endpoint))) {
          // Do not include Authorization header for excluded endpoints
          print("Skipping JWT for: ${options.path}");
        } else {
          // Add JWT Authorization header for other endpoints
          options.headers['Authorization'] =
          'Bearer ${SharedPref.getString(AppConstants.token)}';
          print("Adding JWT for: ${options.path}");
        }

        return handler.next(options); // Continue with the request
      },
    );
  }

  InterceptorsWrapper _responseInterceptors() {
    return InterceptorsWrapper(
      onResponse: (response, handler) async {
        if (response.headers['Authorization'] != null) {
          // Extract the token from the headers
          String token =
              response.headers['Authorization']!.first.split("Bearer ").last;
          // Save the token using Shared Preferences (or any storage solution)
          await SharedPref.setString(AppConstants.token, token);
          print('Token saved: $token');
        }
        return handler.next(response); // Continue with the request
      },
    );
  }

  // Log Interceptor to print request and response data
  LogInterceptor _logInterceptor() {
    return LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (object) => print(object), // Custom logger
    );
  }

  // Error Interceptor to handle errors globally
  InterceptorsWrapper _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException error, handler) {
        // Unauthorized
        if (error.response?.statusCode == HttpStatus.unauthorized) {
          appController.handleUnauthorized();
          return;
        }

        // Handle specific status codes
        switch (error.response?.statusCode) {
          case HttpStatus.notFound:
            appController.handleNotFound();
            return;
          case HttpStatus.tooManyRequests:
            appController.handleRateLimitExceeded();
            return;
          case HttpStatus.internalServerError:
            appController.handleServerError();
            return;
        }

        String errorMessage = '';
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage =
            "It's taking longer than expected. Please wait and try again.";
            break;
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            errorMessage = "Connection timed out. Please try again.";
            break;
          case DioExceptionType.cancel:
            print("Request cancelled by the user");
            break;
          case DioExceptionType.unknown:
            errorMessage = 'Please check your internet connection.';
            break;
          case DioExceptionType.badCertificate:
            print("Bad certificate. Please provide a valid certificate.");
            break;
          case DioExceptionType.badResponse:
            print("Bad response. Server responded with an invalid response.");
            break;
          case DioExceptionType.connectionError:
            print("Connection error. Server responded with an error.");
            break;
        }

        // Notify the app controller
        appController.handleError(errorMessage);
        handler.next(error); // Propagate the error if necessary
      },
    );
  }

  // Method to dispose or reset client configurations if needed
  void dispose() {
    _client.close(force: true);
  }

  @override
  Future deleteRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return _client.delete(endpoint,queryParameters: queryParameters);
  }

  @override
  Future getRequest(String endpoint, {Map<String, dynamic>? queryParameters}) {
    return _client.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future postRequest(String endpoint, {data}) {
    return _client.post(endpoint, data: data);
  }

  @override
  Future putRequest(String endpoint, {data}) {
    return _client.put(endpoint,data:data);
  }
}
