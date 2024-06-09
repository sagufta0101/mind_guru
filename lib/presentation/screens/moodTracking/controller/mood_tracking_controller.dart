import 'dart:developer';

import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/network/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:timezone/standalone.dart' as tz;

import '../../../../model/mood_model.dart';

class MoodTrackingCalenderModel {
  TimeOfDay timeSlot;
  PatientMoodData? moodData;
  MoodTrackingCalenderModel({required this.timeSlot, this.moodData});
}

class MoodTrackingController extends GetxController {
  final ProfileTabService _profileService = ProfileTabService();
  RxBool isLoading = false.obs;
  RxList<PatientMood> moodDataList = <PatientMood>[].obs;
  RxList<PatientMood> datemoodDataList = <PatientMood>[].obs;
  RxList<MoodTrackingCalenderModel> moodTrackingCalenderList =
      <MoodTrackingCalenderModel>[].obs;

  List<MoodTrackingCalenderModel> getMoodTimeSlotsAndData(
      DateTime selectedDate) {
    List<MoodTrackingCalenderModel> slots = [];
    // log(datemoodDataList.first.data.length.toString());
    for (int hour = 7; hour <= 24; hour++) {
      if (datemoodDataList.isNotEmpty &&
          datemoodDataList.first.data.where((p0) {
            return p0.timestamp.hour == hour;
          }).isNotEmpty) {
        List<PatientMoodData> matchedData =
            datemoodDataList.first.data.where((p0) {
          return p0.timestamp.hour == hour;
        }).toList();

        if (matchedData.isNotEmpty) {
          PatientMoodData patientMood = matchedData.first;
          slots.add(MoodTrackingCalenderModel(
              timeSlot: TimeOfDay(hour: hour, minute: 0),
              moodData: patientMood));
        }
      } else {
        slots.add(MoodTrackingCalenderModel(
            timeSlot: TimeOfDay(hour: hour, minute: 0)));
      }
    }
    moodTrackingCalenderList.value = slots;
    return slots;
  }

  getMoodTrackingData({DateTime? selectedDate}) async {
    isLoading(true);
    String? token = GetStorage().read('token');
    log("token-------------------------$token");
    final result = await _profileService.getMoodList(token ?? "");
    if (result.isNotEmpty) {
      moodDataList.value = result;
    }
    getMoodDataBasedOnDate(selectedDate ?? DateTime.now());
    isLoading(false);
  }

  createMood(
    String time,
    String note,
    String rating,
  ) async {
    bool? result = await _profileService.createMood(time, note, rating);
    if (result == true) {
      await getMoodTrackingData();
    }
  }

  getMoodDataBasedOnDate(DateTime selectedDate) {
    String date = DateFormat('yyyy-MM-dd').format(selectedDate);
    print('date----------------------$date');
    datemoodDataList.value = moodDataList.where((p0) {
      print("p0.eventDate---------------${p0.date}");
      return p0.date == date;
    }).toList();
    getMoodTimeSlotsAndData(selectedDate);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getMoodTrackingData();

    super.onInit();
  }
}
