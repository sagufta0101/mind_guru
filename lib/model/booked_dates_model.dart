import 'package:flutter/material.dart';

class BookedDates {
  String bookedDate;
  List<String> bookedTime;

  BookedDates({required this.bookedDate, required this.bookedTime});

  factory BookedDates.fromJson(Map<String, dynamic> json) {
    return BookedDates(
      bookedDate: json['appointment_date'],
      bookedTime: List<String>.from(json['appointment_time']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['appointment_date'] = this.bookedDate;
    data['appointment_time'] = this.bookedTime;
    return data;
  }
}

class TimeSlotsModel {
  TimeOfDay timeSlot;
  bool isNotAvailable;

  TimeSlotsModel({required this.timeSlot, required this.isNotAvailable});
}
