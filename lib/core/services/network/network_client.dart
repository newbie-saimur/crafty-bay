import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'package:crafty_bay/core/services/network/network_response.dart';

class NetworkClient {
  final Logger _logger = Logger();
  final _defaultErrorMessage = "Something went wrong.";

  final VoidCallback onUnauthorize;
  final Map<String, String> Function() commonHeaders;

  NetworkClient({required this.onUnauthorize, required this.commonHeaders});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url: url, headers: commonHeaders());
      Response response = await get(uri, headers: commonHeaders());
      responseLog(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: responseData,
        );
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);
        onUnauthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          data: responseData
        );
      } else {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseData['msg'] ?? _defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url: url, headers: commonHeaders(), body: body);
      Response response = await post(
        uri,
        headers: commonHeaders(),
        body: jsonEncode(body),
      );
      responseLog(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: responseData,
        );
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);
        onUnauthorize();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            data: responseData
        );
      } else {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseData['msg'] ?? _defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url: url, headers: commonHeaders(), body: body);
      Response response = await put(
        uri,
        headers: commonHeaders(),
        body: jsonEncode(body),
      );
      responseLog(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: responseData,
        );
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);
        onUnauthorize();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            data: responseData
        );
      } else {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseData['msg'] ?? _defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url: url, headers: commonHeaders(), body: body);
      Response response = await patch(
        uri,
        headers: commonHeaders(),
        body: jsonEncode(body),
      );
      responseLog(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: responseData,
        );
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);
        onUnauthorize();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            data: responseData
        );
      } else {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseData['msg'] ?? _defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url: url, headers: commonHeaders(), body: body);
      Response response = await delete(
        uri,
        headers: commonHeaders(),
        body: jsonEncode(body),
      );
      responseLog(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: responseData,
        );
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);
        onUnauthorize();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            data: responseData
        );
      } else {
        final responseData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseData['msg'] ?? _defaultErrorMessage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void requestLog({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    final String message =
        '''
    URL -> $url
    HEADERS -> $headers
    BODY -> $body
    ''';

    _logger.i(message);
  }

  void responseLog(Response response) {
    final String message =
        '''
    URL -> ${response.request?.url}
    HEADERS -> ${response.request?.headers}
    BODY -> ${response.body}
    STATUS CODE -> ${response.statusCode}
    ''';

    _logger.i(message);
  }
}
