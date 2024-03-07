import 'package:dio/dio.dart';
import 'package:event_buddy/network/locator.dart';
import 'package:event_buddy/utils/constants/endpoints.dart';
import 'package:flutter/material.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";
const String xRequestedWith = "X-Requested-With";
const String xmlHttpRequest = "XMLHttpRequest";

Duration timeOut = const Duration(minutes: 2); // two minute

class DioClient {
  final Dio _dio = Dio();

  Map<String, dynamic> headers = {
    contentType: applicationJson,
    accept: applicationJson,
    authorization: kPref.getAccessToken(),
    xRequestedWith: xmlHttpRequest,
  };

  DioClient() {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.options.connectTimeout = timeOut;
    _dio.options.receiveTimeout = timeOut;
    _dio.options.headers = headers;
    _dio.interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true),
    );
  }

  Future<Response<dynamic>> get(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response<dynamic>> post(String url, dynamic data) async {
    try {
      return await _dio.post(url, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(error) {
    // Customize error handling as needed
    debugPrint('Dio Error: $error');
    throw error;
  }
}
