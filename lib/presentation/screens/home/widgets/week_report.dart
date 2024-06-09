import 'package:endurance_app/model/weekly_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyMoodReportChart extends StatelessWidget {
  List<WeeklyActivityModel> datalist;
  WeeklyMoodReportChart({required this.datalist});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 20),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.transparent),
              top: BorderSide(color: Colors.transparent),
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              axisNameWidget: Text("Days of the week"),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1, // Ensures a label for each integer
                getTitlesWidget: (double value, TitleMeta meta) {
                  const textStyle = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  );
                  String text;
                  switch (value.toInt()) {
                    case 0:
                      text = 'Day 1';
                      break;
                    case 1:
                      text = 'Day 2';
                      break;
                    case 2:
                      text = 'Day 3';
                      break;
                    case 3:
                      text = 'Day 4';
                      break;
                    case 4:
                      text = 'Day 5';
                      break;
                    case 5:
                      text = 'Day 6';
                      break;
                    case 6:
                      text = 'Day 7';
                      break;
                    default:
                      text = '';
                      break;
                  }
                  return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(text, style: textStyle));
                },
              ),
            ),
            leftTitles: AxisTitles(
              // axisNameSize: 30,
              axisNameWidget: Text("Average mood score"),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1, // Optional, to control the vertical interval
                getTitlesWidget: (double value, TitleMeta meta) {
                  const textStyle = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  );
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(value.round().toString(), style: textStyle),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(
              spots: datalist.map((e) => FlSpot(0, e.avgRating)).toList(),
              //  [
              //   FlSpot(0, 4.5),
              //   FlSpot(1, 5.0),
              //   FlSpot(2, 5.5),
              //   FlSpot(3, 6.0),
              //   FlSpot(4, 3.0), // Noted as the drop on Day 5 in your example
              //   FlSpot(5, 6.0),
              //   FlSpot(6, 6.5),
              // ],
              isCurved: false,
              color: Colors.green,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
