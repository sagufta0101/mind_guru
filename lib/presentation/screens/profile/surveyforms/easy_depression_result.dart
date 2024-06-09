import 'package:flutter/material.dart';

class EasyDepressionResultScreen extends StatelessWidget {
  final double totalScore;
  final String formType;
  final void Function()? onpressed;
  const EasyDepressionResultScreen(
      {Key? key,
      required this.totalScore,
      required this.onpressed,
      required this.formType})
      : super(key: key);

  // String getDepressionLevel() {
  //   if (totalScore <= 4) {
  //     return "Minimal";
  //   } else if (totalScore <= 9) {
  //     return "Mild Depression";
  //   } else if (totalScore <= 14) {
  //     return "Moderate";
  //   } else if (totalScore <= 19) {
  //     return "Moderately Severe";
  //   } else {
  //     return "Severe Depression";
  //   }
  // }

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
              SizedBox(height: 20),
              if (formType == 'easy_depression')
                Text(
                  totalScore <= 0
                      ? "You are all good"
                      : " You may have developed depressive symptoms. For evaluation and probable treatment, he should  visit a psychiatrist.",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'bipolar')
                Text(
                  totalScore > (5 / 11 + 1 + 1)
                      ? "You are all good"
                      : "There is likelihood of bipolar disorder. Further medical assessment is warranted with a psychiatrist",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'psychosis')
                Text(
                  totalScore == 14
                      ? "You are all good"
                      : "There is likelihood of psychosis. Further medical assessment is warranted with a psychiatrist",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'alcohol')
                Text(
                  totalScore == 4
                      ? "You are all good"
                      : "There is likelihood of Alcohol / Drug addiction. this needs detail evaluation and should consult a psychiatrist.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'adult_adhd')
                Text(
                  totalScore <= 16
                      ? "There is high likelihood that you might have ADHD. consult a psychiatrist for better understanding. "
                      : totalScore == 18
                          ? "Congratulations, No ADHD symptoms reported."
                          : "Usually, the probability of ADHD is less with the presence of only one symptom. However, consult a psychiatrist for better understanding.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'children_behaviour')
                Text(
                  totalScore == 17
                      ? "Congratulations, Your child does not have any issue"
                      : "visiting a psychiatrist is advisable.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              if (formType == 'children_behaviour')
                Text(
                  totalScore == 10
                      ? "Congratulations, Your do not have POST PARTUM Psychiatic issues"
                      : "You should consult a psychiatrist",
                  textAlign: TextAlign.center,
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
