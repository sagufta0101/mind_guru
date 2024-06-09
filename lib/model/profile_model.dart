import 'package:flutter/material.dart';

class Doctor {
  final String firstName;
  final String lastName;
  final String clinicAddress;
  final bool isAvailable;
  final DateTime availabilityDate;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.clinicAddress,
    required this.isAvailable,
    required this.availabilityDate,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      firstName: json['first_name'],
      lastName: json['last_name'],
      clinicAddress: json['clinic_address'],
      isAvailable: json['is_available'],
      availabilityDate: DateTime.parse(json['availability_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'clinic_address': clinicAddress,
      'is_available': isAvailable,
      'availability_date': availabilityDate.toIso8601String(),
    };
  }
}

class Patient {
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String address;
  final String medicalIssue;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.address,
    required this.medicalIssue,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      firstName: json['first_name'],
      lastName: json['last_name'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      address: json['address'],
      medicalIssue: json['medical_issue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'address': address,
      'medical_issue': medicalIssue,
    };
  }
}

class PatientProfile {
  final Doctor doctor;
  final Patient patient;

  PatientProfile({
    required this.doctor,
    required this.patient,
  });

  factory PatientProfile.fromJson(Map<String, dynamic> json) {
    return PatientProfile(
      doctor: Doctor.fromJson(json['doctor']),
      patient: Patient.fromJson(json['patient']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor': doctor.toJson(),
      'patient': patient.toJson(),
    };
  }
}
