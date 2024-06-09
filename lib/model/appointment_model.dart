class Appointment {
  final int id;
  final DateTime appointmentTime;
  final String? note;
  final Doctor doctor;
  final Patient patient;

  Appointment({
    required this.id,
    required this.appointmentTime,
    required this.note,
    required this.doctor,
    required this.patient,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      appointmentTime: DateTime.parse(json['appointment_time']),
      note: json['note'],
      doctor: Doctor.fromJson(json['doctor']),
      patient: Patient.fromJson(json['patient']),
    );
  }
}

class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String clinicAddress;
  final bool isAvailable;
  final DateTime? availabilityDate;
  final int user;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.clinicAddress,
    required this.isAvailable,
    required this.availabilityDate,
    required this.user,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      clinicAddress: json['clinic_address'],
      isAvailable: json['is_available'],
      availabilityDate: json['availability_date'] != null
          ? DateTime.parse(json['availability_date'])
          : null,
      user: json['user'],
    );
  }
}

class Patient {
  final int id;
  final DateTime dateOfBirth;
  final String address;
  final String firstName;
  final String lastName;
  final String medicalIssue;
  final int user;

  Patient({
    required this.id,
    required this.dateOfBirth,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.medicalIssue,
    required this.user,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      address: json['address'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      medicalIssue: json['medical_issue'],
      user: json['user'],
    );
  }
}

extension DateTimeExtension on DateTime {
  DateTime get date => DateTime(this.year, this.month, this.day);
}
