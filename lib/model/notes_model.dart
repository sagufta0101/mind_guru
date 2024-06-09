import 'dart:convert';

List<NotesModel> notesModelFromJson(String str) =>
    List<NotesModel>.from(json.decode(str).map((x) => NotesModel.fromJson(x)));

String notesModelToJson(List<NotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesModel {
  NotesModel({
    required this.date,
    required this.data,
  });

  String date;
  List<NoteData> data;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        date: json["date"],
        data:
            List<NoteData>.from(json["data"].map((x) => NoteData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NoteData {
  NoteData({
    required this.id,
    required this.timestamp,
    required this.description,
    required this.patient,
  });

  int id;
  DateTime timestamp;
  String description;
  int patient;

  factory NoteData.fromJson(Map<String, dynamic> json) => NoteData(
        id: json["id"],
        timestamp: DateTime.parse(json["timestamp"]),
        description: json["description"],
        patient: json["patient"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timestamp": timestamp.toIso8601String(),
        "description": description,
        "patient": patient,
      };
}
