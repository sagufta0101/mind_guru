class WeeklyActivityModel {
  final String date;
  final double avgRating;

  WeeklyActivityModel({
    required this.date,
    required this.avgRating,
  });

  factory WeeklyActivityModel.fromJson(Map<String, dynamic> json) {
    return WeeklyActivityModel(
      date: json['date'],
      avgRating: json['avg_rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'avg_rating': avgRating,
    };
  }
}
