import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/app_constant.dart';
import '../routes/route_config.dart';
import '../routes/route_constant.dart';
import 'interpretor/auth_interpretor.dart';

class AuthService {
  final Dio _dio = Dio();

  AuthService() {
    _dio.interceptors.add(AuthApiInterceptor());
  }

  Future<void> auth(String phoneNumber, String password) async {
    try {
      await _dio.post(
        ApiConstant.login,
        data: {
          'phone_no': phoneNumber,
          'password': password,
        },
      );

      AuthApiInterceptor interceptor = _dio.interceptors
              .firstWhere((interceptor) => interceptor is AuthApiInterceptor)
          as AuthApiInterceptor;

      dynamic result = interceptor.responseData;

      if (result != null) {
        print('otp response : $result');
        // Successful response
        GetStorage().write('token', result['token']);
        GetStorage().write('isLogin', true);
        log("login pe h ${GetStorage().read('token')}");
        if (GetStorage().read('token') != null) {
          Get.toNamed(AppRoutes.mainApp, arguments: result['token']);
        }
      } else {
        // Error response
        print('Registration failed');
      }
    } catch (e) {
      throw Exception('Failed to login. Error: $e');
    }
    return;
  }
}
