import 'dart:developer';
import 'dart:io';

import 'package:endurance_app/network/calender_tab_service.dart';
import 'package:endurance_app/shared/widgets/mood_tracker_dialog.dart';
import 'package:endurance_app/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';
import 'model/calender_model.dart';
import 'routes/app_pages.dart';
import 'routes/route_constant.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

notificationDetails() {
  return const NotificationDetails(
    android: AndroidNotificationDetails('sleepTime', 'sleepTime',
        importance: Importance.max),
  );
}

Future showNotification(
    {int id = 0, String? title, String? body, String? payLoad}) async {
  return flutterLocalNotificationsPlugin.show(
      id, title, body, await notificationDetails());
}

Future scheduleNotification(
    {int id = 2,
    String? title,
    String? body,
    String? payLoad,
    required DateTime scheduledNotificationDateTime}) async {
  return flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        scheduledNotificationDateTime,
        tz.local,
      ),
      await notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
}
// Future<void> scheduleNotification() async {
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'sleepTime',
//     'sleepTime',
//     channelDescription: 'your_channel_description',
//     importance: Importance.max,
//     priority: Priority.high,
//   );
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     2,
//     'Scheduled Notification',
//     'This notification was scheduled at 10 PM.',
//     _nextInstanceOfTenPM(),
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true,
//     payload: "sleepTime",
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//   );
//   log(
//     'This notification was scheduled at 10 PM.',
//   );
// }

// tz.TZDateTime _nextInstanceOfTenPM() {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledDate =
//       tz.TZDateTime(tz.local, now.year, now.month, now.day, 22, 40);
//   if (scheduledDate.isBefore(now)) {
//     scheduledDate = scheduledDate.add(Duration(days: 1));
//   }
//   log(scheduledDate.toString());
//   return scheduledDate;
// }

@pragma('vm:entry-point')
void callbackDispatcher() {
  print('it getting called when work manager');
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      // case "sendMoodTrackingTask":
      //   await sendMoodTrackingNotification();

      //   break;
      // case "sendAnxietyTask":
      //   await sendAnxityNotificationTask();

      //   break;
      case "scheduleMedicineRemainderTask":
        await scheduleAlarmTask();

        break;

      // Add other cases for different tasks if needed
    }

    return Future.value(true);
  });
}

sendAnxityNotificationTask() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'depression', // Channel ID
    'Your depression', // Channel name
    channelDescription: 'Your channel description', // Channel description
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    1, // Notification ID
    'Hy How are you', // Notification title
    'Lets track your anxity level', // Notification body
    platformChannelSpecifics,
    payload: 'depressionForm',
  );
}

scheduleAlarmTask() async {
  await GetStorage.init(); // and here
  String? token = GetStorage().read('token');

  log("token-------------------------$token");
  List<CalenderModel> events =
      await HomeTabService().getScheduleCalender(token!);
  // CalenderModel event=events.where((element) => element.eventDate==DateTime.now())
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  List<CalenderModel> dateScheduleList = events.where((p0) {
    return p0.eventDate == date;
  }).toList();
  for (CalenderModel event in dateScheduleList) {
    List timings = event.prescriptionDetails.time.split(":");
    DateTime time = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, timings.first, timings[1]);
    // if (time.difference(DateTime.now()) <= Duration(hours: 2)) {
    scheduleNotification(
        scheduledNotificationDateTime: time,
        body: 'Take your medicine ${event.prescriptionDetails.medicine}',
        id: 3,
        title: 'Medicine Remainder',
        payLoad: 'calenderTab');
    // }

    // Creates an alarm
    // FlutterAlarmClock.createAlarm(
    //     hour: int.tryParse(timings.first) ?? 22,
    //     title: 'Take your medicine ${event.prescriptionDetails.medicine}',
    //     minutes: int.tryParse(timings[1]) ?? 11);
  }
  // FlutterAlarmClock.showAlarms();
  log("kam krra h");
}

sendMoodTrackingNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'moodTracking', // Channel ID
    'mood Tracking', // Channel name
    channelDescription: 'Your mood Tracking description', // Channel description
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'Hy!', // Notification title
    'How are you feeling today', // Notification body
    platformChannelSpecifics,
    payload: 'moodTracking',
  );

  log("moodTracking kam krra h");
}

Future<void> initializeNotifications(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (payload) {
      log("payload===============$payload");
      if (payload == 'depressionForm') {
        Get.toNamed(
          AppRoutes.depressionForm,
        );
      }
      // if (payload == 'moodTracking') {
      //   showMoodTrackingDialog();
      // }
      // if (payload == 'setAlarm') {
      //   showMoodTrackingDialog();
      // }
    },
  );
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // Initialize the plugin
  await initializeNotifications(flutterLocalNotificationsPlugin);
  tz.initializeTimeZones();

  try {
    if (Platform.isAndroid) {
      // Check if the app has permission to ignore battery optimizations
      await Permission.ignoreBatteryOptimizations.request();

      var status = await Permission.ignoreBatteryOptimizations.status;
      log("status-----------------${status}");
      if (!status.isGranted) {
        // Request permission to ignore battery optimizations
        await Permission.ignoreBatteryOptimizations.request();
      }
    }
    // registerWorkManageer();
    // _scheduleNotification();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) {
        runApp(const MyApp());
      },
    );
  } catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase or Workmanager: $e');
    }
  }
}

void registerWorkManageer() {
  String? token = GetStorage().read('token');

  log("token-----registerWorkManageer--------------------$token");

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  print('Workmanager initialized');

  // Workmanager().registerPeriodicTask(
  //   "sendAnxietyTask",
  //   "sendAnxietyTask",
  //   frequency: Duration(minutes: 15),
  //   initialDelay: Duration.zero,
  // );
  // Workmanager().registerPeriodicTask(
  //   "sendMoodTrackingTask",
  //   "sendMoodTrackingTask",
  //   frequency: Duration(minutes: 16),
  //   initialDelay: Duration.zero,
  // );
  Workmanager().registerPeriodicTask(
    "scheduleMedicineRemainderTask",
    "scheduleMedicineRemainderTask",
    frequency: Duration(hours: 2),
    initialDelay: Duration.zero,
  );
  log('Periodic task registered');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Endurance App',
      theme: lightTheme,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      // routerConfig: AppRoutes().router,
      // routeInformationProvider: AppRoutes().router.routeInformationProvider,
      // routeInformationParser: AppRoutes().router.routeInformationParser,
      // routerDelegate: AppRoutes().router.routerDelegate,
    );
  }
}
