import 'package:endurance_app/presentation/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../profile/controller/profile_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    Get.put(SplashController());
    Get.put(ProfileTabController());
    // initializeNotifications();
    // scheduleNotification();
    super.initState();
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, iOS: null);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotification() async {
    final prefs = GetStorage();
    final int lastNotificationTime = prefs.read('lastNotificationTime') ?? 0;
    final int currentTime = DateTime.now().millisecondsSinceEpoch;

    // Schedule notification if it's been more than 7 days since the last one
    if (currentTime - lastNotificationTime > 7 * 24 * 60 * 60 * 1000) {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
              'scheduled_channel', 'Scheduled Notifications',
              channelDescription: 'Scheduled notifications channel',
              importance: Importance.max,
              priority: Priority.high);
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          'Scheduled Notification',
          'This is a scheduled notification.',
          tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
          platformChannelSpecifics,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);

      // Save current time as last notification time
      prefs.write('lastNotificationTime', currentTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/user_app_icon.jpeg'))
          ],
        ));
  }
}
