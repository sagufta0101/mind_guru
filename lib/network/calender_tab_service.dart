import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:endurance_app/model/audio_model.dart';
import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/model/daily_activity_model.dart';
import 'package:endurance_app/model/mood_model.dart';
import 'package:endurance_app/model/prescription_analytics_model.dart';
import 'package:endurance_app/model/profile_model.dart';
import 'package:endurance_app/model/weekly_activity_model.dart';

import '../constant/app_constant.dart';
import '../model/notes_model.dart';
import 'interpretor/common_interceptor.dart';

class HomeTabService {
  final Dio _dio = Dio();

  HomeTabService() {
    _dio.interceptors.add(CommonApiInterceptor());
  }

  Future<List<CalenderModel>> getScheduleCalender(String token) async {
    dynamic result = await _dio.get('${ApiConstant.listCalender}',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Token ${token}"
        }));
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<CalenderModel> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in result) {
        rollData.add(CalenderModel.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<List<AudioModel>> getAudioApi() async {
    dynamic result = await _dio.get(
      '${ApiConstant.audioList}',
    );
    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<AudioModel> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in result) {
        rollData.add(AudioModel.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<List<PatientProfile>> getProfileData() async {
    dynamic result = await _dio.get(
      '${ApiConstant.profileinfo}',
    );
    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<PatientProfile> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in [result]) {
        rollData.add(PatientProfile.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<List<DailyActivity>> getDailyMoodReport() async {
    dynamic result = await _dio.get(
      '${ApiConstant.moodReport}',
    );
    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<DailyActivity> rollData = [];
    if (result != null) {
      // Successful response
      log(result.toString());
      for (var element in result) {
        rollData.add(DailyActivity.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<List<WeeklyActivityModel>> getWeeklyMoodReport() async {
    dynamic result = await _dio.get(
      '${ApiConstant.weekMoodReport}',
    );
    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<WeeklyActivityModel> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in result) {
        rollData.add(WeeklyActivityModel.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<PrescriptionAnalytics?> getPillstakenPercentage() async {
    await _dio.get(
      '${ApiConstant.prescriptionAnalytics}',
    );

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;
    PrescriptionAnalytics? rollData;
    if (result != null) {
      // Successful response
      // for (var element in result) {
      rollData = PrescriptionAnalytics.fromJson(result);
      // }
      return rollData;
    } else {
      // Error response
      return null;
    }
  }

  Future<bool> updateIsTakenStatus(bool isTaken, int id) async {
    await _dio.put('${ApiConstant.markTakenOrNot}$id/', data: {
      "is_taken": isTaken,
    });

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;

    if (result != null) {
      // Successful response

      return true;
    } else {
      // Error response
      return false;
    }
  }

  Future<List<NotesModel>> getNotes(String token) async {
    dynamic result = await _dio.get('${ApiConstant.listNote}',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Token ${token}"
        }));
    result = result.data;
    // dynamic result = interceptor.responseData;
    List<NotesModel> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in result) {
        rollData.add(NotesModel.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<bool> createNotes(String timestamp, String description) async {
    await _dio.post('${ApiConstant.createNote}', data: {
      "timestamp": timestamp,
      "description": description,
    });

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;

    if (result != null && result['success']) {
      // Successful response

      return true;
    } else {
      // Error response
      return false;
    }
  }
}
