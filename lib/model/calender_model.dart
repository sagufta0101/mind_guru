class CalenderModel {
  int id;
  String eventDate;
  int prescription;
  bool? istaken;
  PrescriptionDetails prescriptionDetails;

  CalenderModel(
      {required this.id,
      required this.eventDate,
      required this.prescription,
      required this.istaken,
      required this.prescriptionDetails});

  factory CalenderModel.fromJson(Map<String, dynamic> json) {
    return CalenderModel(
      id: json['id'],
      eventDate: json['event_date'],
      prescription: json['prescription'],
      istaken: json['is_taken'],
      prescriptionDetails:
          PrescriptionDetails.fromJson(json['prescription_details']),
    );
  }
}

class PrescriptionDetails {
  int id;
  String time;
  String startDate;
  int patient;
  String medicine;
  String power;
  String frequency;
  String instruction;

  PrescriptionDetails({
    required this.id,
    required this.time,
    required this.startDate,
    required this.patient,
    required this.medicine,
    required this.power,
    required this.frequency,
    required this.instruction,
  });

  factory PrescriptionDetails.fromJson(Map<String, dynamic> json) {
    return PrescriptionDetails(
      id: json['id'],
      time: json['time'],
      startDate: json['start_date'],
      patient: json['patient'],
      medicine: json['medicine'],
      power: json['power'],
      frequency: json['frequency'],
      instruction: json['instruction'],
    );
  }
}
