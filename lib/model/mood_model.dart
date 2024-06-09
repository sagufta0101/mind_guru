import 'dart:convert';

List<PatientMood> patientMoodFromJson(dynamic str) =>
    List<PatientMood>.from(str.map((x) => PatientMood.fromJson(x)));

String patientMoodToJson(List<PatientMood> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientMood {
  PatientMood({
    required this.date,
    required this.data,
  });

  String date;
  List<PatientMoodData> data;

  factory PatientMood.fromJson(Map<String, dynamic> json) => PatientMood(
        date: json["date"],
        data: List<PatientMoodData>.from(
            json["data"].map((x) => PatientMoodData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PatientMoodData {
  PatientMoodData({
    required this.id,
    required this.timestamp,
    required this.rating,
    required this.activities,
    required this.patient,
  });

  int id;
  DateTime timestamp;
  int rating;
  String activities;
  int patient;

  factory PatientMoodData.fromJson(Map<String, dynamic> json) =>
      PatientMoodData(
        id: json["id"],
        timestamp: DateTime.parse(json["timestamp"]),
        rating: json["rating"],
        activities: json["activities"],
        patient: json["patient"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timestamp": timestamp.toIso8601String(),
        "rating": rating,
        "activities": activities,
        "patient": patient,
      };
}
