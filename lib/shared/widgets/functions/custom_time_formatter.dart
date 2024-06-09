import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}

String convertTo24HourFormat(DateTime date, TimeOfDay selectedTime) {
  String hour = selectedTime.hour.toString().padLeft(2, '0');
  String minute = selectedTime.minute.toString().padLeft(2, '0');

  return DateFormat('yyyy-MM-dd').format(date) +
      'T' +
      hour +
      ':' +
      minute +
      ':00';
}
