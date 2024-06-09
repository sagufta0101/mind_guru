import 'package:endurance_app/main.dart';
import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/model/prescription_analytics_model.dart';
import 'package:endurance_app/model/weekly_activity_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../model/daily_activity_model.dart';
import '../../../network/calender_tab_service.dart';

class HomeTabController extends GetxController {
  final HomeTabService _homeService = HomeTabService();
  RxBool isLoading = false.obs;
  // RxList<CalenderModel> scheduleList = <CalenderModel>[].obs;
  RxList<DailyActivity> dailyActivityReportList = <DailyActivity>[].obs;
  RxList<WeeklyActivityModel> weeklyActivityReportList =
      <WeeklyActivityModel>[].obs;
  Rx<PrescriptionAnalytics?> analytics = PrescriptionAnalytics().obs;

  getHomeAnalytics() async {
    isLoading(true);
    final result = await _homeService.getPillstakenPercentage();
    // if (result != null) {
    analytics.value = result;
    // }
    isLoading(false);
  }

  getDailyMoodTrackingReport() async {
    isLoading(true);
    final result = await _homeService.getDailyMoodReport();
    // if (result != null) {
    dailyActivityReportList.value = result;
    // }
    isLoading(false);
  }

  getWeeklyMoodTrackingReport() async {
    isLoading(true);
    final result = await _homeService.getWeeklyMoodReport();
    // if (result != null) {
    weeklyActivityReportList.value = result;
    // }
    isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await Permission.ignoreBatteryOptimizations.request();
    await Permission.notification.request();
    await getHomeAnalytics();
    await getDailyMoodTrackingReport();
    await initializeNotifications(flutterLocalNotificationsPlugin);
    registerWorkManageer();
    await scheduleNotificationForSleep();
    await scheduleNotiMorningAlarmSetup();
    super.onInit();
  }

  Future<void> scheduleNotiMorningAlarmSetup() async {
    if (DateTime.now().hour <= 9 && DateTime.now().minute < 00) {
      await scheduleNotification(
          scheduledNotificationDateTime: DateTime(DateTime.now().year,
              DateTime.now().month, DateTime.now().day, 9, 00),
          body: 'Good Morning, Setup Medicine Alarm',
          id: 6,
          payLoad: 'setAlarm',
          title: 'tap to Setup Medicine remainder');
    } else {
      await scheduleNotification(
          scheduledNotificationDateTime: DateTime(DateTime.now().year,
              DateTime.now().month, DateTime.now().day + 1, 9, 00),
          body: 'Good Morning, Setup Medicine Alarm',
          id: 6,
          payLoad: 'setAlarm',
          title: 'tap to Setup Medicine remainder');
    }
  }

  Future<void> scheduleNotificationForSleep() async {
    if (DateTime.now().hour <= 22 && DateTime.now().minute < 00) {
      await scheduleNotification(
          scheduledNotificationDateTime: DateTime(DateTime.now().year,
              DateTime.now().month, DateTime.now().day, 22, 00),
          body: 'Sleep its Bed time',
          id: 2,
          payLoad: 'sleepTime',
          title: 'Time for bed');
    } else {
      await scheduleNotification(
          scheduledNotificationDateTime: DateTime(DateTime.now().year,
              DateTime.now().month, DateTime.now().day + 1, 22, 00),
          body: 'Sleep its Bed time',
          id: 2,
          payLoad: 'sleepTime',
          title: 'Time for bed');
    }
  }
}
