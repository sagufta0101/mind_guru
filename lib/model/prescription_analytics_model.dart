class PrescriptionAnalytics {
  int? medicineTakenCount;
  int? medicineMissedCount;
  double? medicineTakenPercentage;
  String? startOfWeek;
  String? endOfWeek;

  PrescriptionAnalytics({
    this.medicineTakenCount,
    this.medicineMissedCount,
    this.medicineTakenPercentage,
    this.startOfWeek,
    this.endOfWeek,
  });

  factory PrescriptionAnalytics.fromJson(Map<String, dynamic> json) {
    return PrescriptionAnalytics(
      medicineTakenCount: json['medicine_taken_count'] ?? 0,
      medicineMissedCount: json['medicine_missed_count'] ?? 0,
      medicineTakenPercentage: json['medicine_taken_percentage'] ?? 0.0,
      startOfWeek: json['start_of_week'] ?? "",
      endOfWeek: json['end_of_week'] ?? "",
    );
  }
}
