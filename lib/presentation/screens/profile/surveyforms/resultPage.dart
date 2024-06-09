import 'package:flutter/material.dart';

class DepressionResultScreen extends StatelessWidget {
  final double totalScore;
  final String formType;
  final void Function()? onpressed;
  const DepressionResultScreen(
      {Key? key,
      required this.totalScore,
      required this.onpressed,
      required this.formType})
      : super(key: key);

  String getDepressionLevel() {
    if (totalScore <= 4) {
      return "Minimal";
    } else if (totalScore <= 9) {
      return "Mild Depression";
    } else if (totalScore <= 14) {
      return "Moderate";
    } else if (totalScore <= 19) {
      return "Moderately Severe";
    } else {
      return "Severe Depression";
    }
  }

  String getAnxietyLevel() {
    if (totalScore <= 4) {
      return "Minimal";
    } else if (totalScore <= 9) {
      return "Mild Anxiety";
    } else if (totalScore <= 14) {
      return "Moderate";
    } else {
      return "Severe anxiety";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Result'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score: $totalScore',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              if (formType == 'easy_depression' ||
                  formType == 'severity_depression')
                Text(
                  'Depression Level:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              if (formType == 'severity_depression')
                Text(
                  getDepressionLevel(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'anxiety')
                Text(
                  getAnxietyLevel(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: onpressed,
                child: Text('Complete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
