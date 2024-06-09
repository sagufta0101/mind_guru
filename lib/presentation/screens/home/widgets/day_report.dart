import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../model/daily_activity_model.dart';

class ActivityChart extends StatefulWidget {
  List<DailyActivity> dailyActivityReportList;
  ActivityChart({required this.dailyActivityReportList});
  @override
  _ActivityChartState createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  List<DailyActivity> _data = [
    // ActivityScore('Reading', 85),
    // ActivityScore('Jogging', 70),
    // ActivityScore('Watching TV', 50),
    // ActivityScore('Cooking', 60),
    // ActivityScore('Working', 75),
    // Add more activities as needed
  ];
  @override
  void initState() {
    _data = widget.dailyActivityReportList;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double averageScore =
        _data.map((e) => e.avgRating).reduce((a, b) => a + b) / _data.length;

    List<BarChartGroupData> barGroups = _data.asMap().entries.map((entry) {
      int index = entry.key;
      DailyActivity activity = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
              toY: activity.avgRating,
              color:
                  activity.avgRating > averageScore ? Colors.green : Colors.red,
              width: 16,
              borderRadius: BorderRadius.circular(4))
        ],
        // showingTooltipIndicators: [0],
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Container(
          width: _data.length *
              60.0, // Adjust the width based on the number of entries
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20), // Increased top padding to avoid cutting numbers
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY:
                    10, // Increase maxY value to provide more space at the top
                barGroups: barGroups,
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    axisNameWidget: Text("Activities of the Day"),
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final index = value.toInt();
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12,
                          ), // Added to ensure label clearance
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(_data[index].activity,
                                style: TextStyle(fontSize: 11)),
                          ),
                        );
                      },
                      reservedSize:
                          80, // Increase if necessary to avoid cutting off rotated text
                    ),
                  ),
                  leftTitles: AxisTitles(
                    axisNameWidget: Text("Mood Rating"),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40, // Increased reserved size
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('${value.toInt()}'),
                        );
                      },
                      interval: 1,
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 1 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.8,
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                      color: Colors.transparent,
                      width: 0), // Adding border for padding
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityScore {
  final String activity;
  final double score;

  ActivityScore(this.activity, this.score);
}

class MoodTrackerChart extends StatelessWidget {
  final List<double> moodScores = [
    6,
    4,
    7,
    3,
    5,
    6,
    2,
    6,
    8,
    5,
    3,
    2,
    7,
    6,
    8,
    5,
    4,
    3,
    7,
    6,
    2,
    4,
    6,
    7
  ]; // Example mood scores for each hour

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 16), // Add padding around the chart
      child: AspectRatio(
        aspectRatio: 3.5, // Adjust the aspect ratio to fit your layout
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 10, // Maximum Y value on the axis
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                axisNameWidget: Text("Hours of the Day"),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text('${index}:00'), // Display every third hour
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                axisNameWidget: Text("Days of the week"),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40, // Increased reserved size
                  getTitlesWidget: (value, meta) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${value.toInt()}'),
                    );
                  },
                  interval: 1,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (value) => value % 1 == 0,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey,
                strokeWidth: 0.8,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                  color: Colors.transparent,
                  width: 0), // Adding border for padding
            ),
            barGroups: List.generate(moodScores.length, (index) {
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: moodScores[index],
                    color: moodScores[index] < 5 ? Colors.red : Colors.green,
                    width: 14, // Width of the bars
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
