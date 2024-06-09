import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdultAdhdFormLanding extends StatefulWidget {
  AdultAdhdFormLanding({super.key});

  @override
  State<AdultAdhdFormLanding> createState() => _AdultAdhdFormLandingState();
}

class _AdultAdhdFormLandingState extends State<AdultAdhdFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'adult_adhd',
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question":
          "1.	Do you find hard to finish the project at later stages, even if it’s the easier one ?",
      "options": ["Yes", "No"],
    },
    {
      "question": "2.	is multitasking difficult ?",
      "options": ["Yes", "No"],
    },
    {
      "question": "3.	do you forget appointments frequently ?",
      "options": ["Yes", "No"],
    },
    {
      "question": "4.	do you avoid or delay brainy tasks? ",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "5.	do you keep on moving your hands and feet while sitting for long?",
      "options": ["Yes", "No"],
    },
    {
      "question": "6.	do you feel driven by motor with loose brakes?",
      "options": ["Yes", "No"],
    },
    {
      "question": "7.	do you make frequent careless mistakes ?",
      "options": ["Yes", "No"],
    },
    {
      "question": "8.	do you get bored easily and loose focus ?",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "9.	do you loose track of sentences, even when someone is directly talking to you ",
      "options": ["Yes", "No"],
    },
    {
      "question": "10.	do you often misplace things?",
      "options": ["Yes", "No"],
    },
    {
      "question": "11.	are you easily distracted by surroundings ?",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "12.	 is it hard to be seated at one place, even in important meetings?",
      "options": ["Yes", "No"],
    },
    {
      "question": "13.	do you feel restless and fidgety ?",
      "options": ["Yes", "No"],
    },
    {
      "question": "14.	do you have trouble at relaxing even in free time?",
      "options": ["Yes", "No"],
    },
    {
      "question": "15.	do you talk too much? ",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "16.	do you cut others even before they complete their sentence? ",
      "options": ["Yes", "No"],
    },
    {
      "question": "17.	do you have difficulty waiting for your turn?",
      "options": ["Yes", "No"],
    },
    {
      "question": "18.	do you interrupt others while they are busy",
      "options": ["Yes", "No"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to Self Assessment form"),
                Text(
                    "The questions are for your past 6 months, or ever in your life"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please answer each question to the best of your ability.",
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}
