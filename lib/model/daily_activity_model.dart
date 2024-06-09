class DailyActivity {
  String activity;
  double avgRating;

  DailyActivity(
    this.activity,
    this.avgRating,
  );

  factory DailyActivity.fromJson(Map<String, dynamic> json) {
    return DailyActivity(
      json['activity'],
      json['avg_rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'avg_rating': avgRating,
    };
  }
}
