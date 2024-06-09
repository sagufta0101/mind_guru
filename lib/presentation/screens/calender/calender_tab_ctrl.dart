import 'dart:developer';

import 'package:endurance_app/model/calender_model.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

import '../../../network/calender_tab_service.dart';

// Initialize the FlutterLocalNotificationsPlugin at a global level
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

class CalenderTabController extends GetxController {
  final HomeTabService _homeService = HomeTabService();
  RxBool isLoading = false.obs;
  RxList<CalenderModel> scheduleList = <CalenderModel>[].obs;
  RxList<CalenderModel> dateScheduleList = <CalenderModel>[].obs;
  getCalenderData() async {
    isLoading(true);
    String? token = GetStorage().read('token');
    log("token-------------------------$token");
    final result = await _homeService.getScheduleCalender(token!);
    if (result.isNotEmpty) {
      scheduleList.value = result;
    }
    isLoading(false);
  }

  // Future<void> scheduleNotification(

  //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  //     CalenderModel calendarEvent) async {
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     '001',
  //     'alarm',
  //     channelDescription: 'your_channel_description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   var platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //     iOS: null,
  //     macOS: null,
  //   );

  //   DateTime scheduledDate =
  //       DateTime.parse(calendarEvent.eventDate).add(Duration(
  //           hours: DateTime.now().hour,
  //           // int.parse(calendarEvent.prescriptionDetails.time.split(":")[0]),
  //           minutes: DateTime.now().minute + 1
  //           //  int.parse(
  //           //     calendarEvent.prescriptionDetails.time.split(":")[5])
  //           ));

  //   tz.TZDateTime scheduledTZDateTime = tz.TZDateTime.from(
  //     scheduledDate,
  //     tz.getLocation('Asia/Kolkata'),
  //   );
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     calendarEvent.id,
  //     'Medicine Reminder',
  //     'Time to take your medicine: ${calendarEvent.prescriptionDetails.medicine}',
  //     // tz.TZDateTime.from(scheduledDate, tz.local),
  //     scheduledTZDateTime,
  //     platformChannelSpecifics,
  //     androidScheduleMode: AndroidScheduleMode.alarmClock,
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );
  // }

  manageIsTakenStatus(bool isTaken, int id) async {
    bool? result = await _homeService.updateIsTakenStatus(isTaken, id);
    if (result == true) {
      await getCalenderData();
    }
  }

  getScheduleBasedOnDate(DateTime selectedDate) {
    String date = DateFormat('yyyy-MM-dd').format(selectedDate);
    print('date----------------------$date');

    dateScheduleList.value = scheduleList.where((p0) {
      print("p0.eventDate---------------${p0.eventDate}");
      return p0.eventDate == date;
    }).toList();
    print(dateScheduleList.length);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getCalenderData();
    await getScheduleBasedOnDate(DateTime.now());
    List<CalenderModel> listForAlarm = dateScheduleList
        .where((p0) =>
            int.tryParse(p0.prescriptionDetails.time.split(":")[0])! >=
                DateTime.now().hour &&
            int.tryParse(p0.prescriptionDetails.time.split(":")[1])! >=
                DateTime.now().minute)
        .toList();
    // scheduleAlarm();
    for (CalenderModel event in listForAlarm
        // dateScheduleList.value
        ) {
      // await scheduleNotification(flutterLocalNotificationsPlugin, event);
      scheduleAlarm(event);
      // FlutterAlarmClock.showAlarms();
    }

    super.onInit();
  }

  void scheduleAlarm(CalenderModel event) {
    log('sdvwvvbsf');
    List timings = event.prescriptionDetails.time.split(":");
    // Creates an alarm at 23:59
    FlutterAlarmClock.createAlarm(
        hour: int.tryParse(timings.first) ?? 22,
        title: 'Calendar tab se bna h',
        minutes: int.tryParse(timings[1]) ?? 11);
    // FlutterAlarmClock.showAlarms();
  }
}
