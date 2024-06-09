import 'package:dio/dio.dart';
import 'package:endurance_app/model/appointment_model.dart';
import 'package:endurance_app/model/booked_dates_model.dart';
import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/model/prescription_analytics_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/app_constant.dart';
import 'interpretor/common_interceptor.dart';

class AppointmentService {
  final Dio _dio = Dio();

  AppointmentService() {
    _dio.interceptors.add(CommonApiInterceptor());
  }

  Future<List<Appointment>> getAppointmentList() async {
    await _dio.get(
      '${ApiConstant.listAppointment}',
    );

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;

    // dynamic result = interceptor.responseData;
    List<Appointment> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in result['data']) {
        rollData.add(Appointment.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<List<BookedDates>> getBookedDates() async {
    await _dio.get(
      '${ApiConstant.bookedDatesAndTime}',
    );

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;

    // dynamic result = interceptor.responseData;
    List<BookedDates> rollData = [];
    if (result != null) {
      // Successful response
      for (var element in result['data']) {
        rollData.add(BookedDates.fromJson(element));
      }
      return rollData;
    } else {
      // Error response
      return [];
    }
  }

  Future<DateTime?> getStartAvailableDate() async {
    await _dio.get(
      '${ApiConstant.docAvailableDate}',
    );

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;

    // dynamic result = interceptor.responseData;
    List<BookedDates> rollData = [];
    if (result != null) {
      String? sDate = result['data']['availability_date'];
      return sDate != null ? DateTime.parse(sDate) : null;
    } else {
      // Error response
      return null;
    }
  }

  Future<bool> createAppointment(String time, String note) async {
    await _dio.post('${ApiConstant.bookAppointment}',
        data: {"doctor_id": "1", "appointment_time": time, "note": note});

    CommonApiInterceptor interceptor = _dio.interceptors
            .firstWhere((interceptor) => interceptor is CommonApiInterceptor)
        as CommonApiInterceptor;

    dynamic result = interceptor.responseData;
    PrescriptionAnalytics? rollData;
    if (result != null) {
      // Successful response
      // for (var element in result) {
      Fluttertoast.showToast(msg: result['message'] ?? result['error']);

      // }

      return result['success'] ?? true;
    } else {
      // Error response
      return false;
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
}
