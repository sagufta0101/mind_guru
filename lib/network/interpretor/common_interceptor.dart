import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class CommonApiInterceptor extends Interceptor {
  dynamic _responseData;

  dynamic get responseData => _responseData;
  final box = GetStorage();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Log request
    options.headers["Authorization"] = "Token ${box.read('token')}";
    debugPrint('Request: ${options.method} ${options.uri}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Body: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log response
    debugPrint('Response: ${response.statusCode}');
    debugPrint('Headers: ${response.headers}');
    debugPrint('Body: ${response.data}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      // Successful response
      _responseData = response.data;
      // Fluttertoast.showToast(
      //     msg: '${response.data['message']}', gravity: ToastGravity.BOTTOM);
    }

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Log error
    debugPrint('Error: ${err.message}');
    if (err.response != null) {
      debugPrint('Response Status Code: ${err.response?.statusCode}');
      debugPrint('Response Data: ${err.response?.data}');
      if (err.response?.statusCode == 400) {
        // Bad request error
        // Fluttertoast.showToast(
        //     msg: '${err.response?.data['message']}',
        //     gravity: ToastGravity.BOTTOM);
      } else if (err.response?.statusCode == 401) {
        // Bad request error
        // Fluttertoast.showToast(
        //     msg: '${err.response?.data['message']}',
        //     gravity: ToastGravity.BOTTOM);
      }
    }

    _responseData = null;
    return super.onError(err, handler);
  }
}
