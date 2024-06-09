import 'package:dio/dio.dart';
import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/model/prescription_analytics_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/app_constant.dart';
import '../model/mood_model.dart';
import 'interpretor/common_interceptor.dart';

class ProfileTabService {
  final Dio _dio = Dio();

  ProfileTabService() {
    _dio.interceptors.add(CommonApiInterceptor());
  }

  Future<List<PatientMood>> getMoodList(String token) async {
    dynamic result = await _dio.get('${ApiConstant.listMood}',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Token ${token}"
        }));
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<PatientMood> rollData = [];
    if (result != null) {
      rollData = patientMoodFromJson(result);
      // Successful response

      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<bool> createMood(String time, String note, String rating) async {
    await _dio.post('${ApiConstant.createMood}', data: {
      "timestamp": time,
      "rating": rating,
      "activities": note,
    });

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;
    PrescriptionAnalytics? rollData;
    if (result != null) {
      // Successful response
      // for (var element in result) {
      if (result['success'])
        Fluttertoast.showToast(msg: 'Successfully added entry');

      // }

      return result['success'] ?? true;
    } else {
      // Error response
      return false;
    }
  }
}
