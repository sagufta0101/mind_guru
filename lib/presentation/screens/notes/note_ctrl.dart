import 'dart:developer';

import 'package:endurance_app/model/calender_model.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz;
import '../../../model/mood_model.dart';
import '../../../model/notes_model.dart';
import '../../../network/calender_tab_service.dart';

class NoteController extends GetxController {
  final HomeTabService _homeService = HomeTabService();
  RxBool isLoading = false.obs;
  RxList<NotesModel> scheduleList = <NotesModel>[].obs;
  RxList<NoteData> dateScheduleList = <NoteData>[].obs;
  getNotesData() async {
    isLoading(true);
    String? token = GetStorage().read('token');
    log("token-------------------------$token");
    final result = await _homeService.getNotes(token!);
    if (result.isNotEmpty) {
      scheduleList.value = result;
    }
    isLoading(false);
  }

  createNote(String timestamp, String note) async {
    bool? result = await _homeService.createNotes(timestamp, note);
    if (result == true) {
      Get.back();
      await getNotesData();
      getNotesBasedOnDate(DateTime.parse(timestamp));
    }
  }

  getNotesBasedOnDate(DateTime selectedDate) {
    String date = DateFormat('yyyy-MM-dd').format(selectedDate);
    print('date----------------------$date');
    List<NoteData> filteredNotes = [];
    for (var element in scheduleList) {
      if (element.date == date) {
        filteredNotes.addAll(element.data);
      }
    }
    dateScheduleList.value = filteredNotes;
    // dateScheduleList.value = scheduleList.where((p0) {
    //   print("p0.eventDate---------------${p0.data}");
    //   return p0.date == date;
    // }).toList();
    print(dateScheduleList.length);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getNotesData();
    await getNotesBasedOnDate(DateTime.now());

    super.onInit();
  }
}
