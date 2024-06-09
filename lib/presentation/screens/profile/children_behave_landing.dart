import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChildrenIssuesFormLanding extends StatefulWidget {
  ChildrenIssuesFormLanding({super.key});

  @override
  State<ChildrenIssuesFormLanding> createState() =>
      _ChildrenIssuesFormLandingState();
}

class _ChildrenIssuesFormLandingState extends State<ChildrenIssuesFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'children_behaviour',
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question": "1.	Remaining unhappy or Sadness",
      "options": ["Yes", "No"],
    },
    {
      "question": "2.	Too much of Daydream ",
      "options": ["Yes", "No"],
    },
    {
      "question": "3.	keeping secrets ",
      "options": ["Yes", "No"],
    },
    {
      "question": "4.	difficulty in understanding other people’s feelings",
      "options": ["Yes", "No"],
    },
    {
      "question": "5.	Have trouble Focusing",
      "options": ["Yes", "No"],
    },
    {
      "question": "6.	frequent Fights/ arguments with other children",
      "options": ["Yes", "No"],
    },
    {
      "question": "7.	frequently Blame others for own mistakes",
      "options": ["Yes", "No"],
    },
    {
      "question": "8.	Unable to express emotions",
      "options": ["Yes", "No"],
    },
    {
      "question": "9.	unable to enjoy Play processes",
      "options": ["Yes", "No"],
    },
    {
      "question": "10.	Do not listen to rules ",
      "options": ["Yes", "No"],
    },
    {
      "question": "11.	Act as if driven by a motor",
      "options": ["Yes", "No"],
    },
    {
      "question": "12.	Tease others",
      "options": ["Yes", "No"],
    },
    {
      "question": "13.	Worry a lot",
      "options": ["Yes", "No"],
    },
    {
      "question": "14.	Take things that do not belong to you",
      "options": ["Yes", "No"],
    },
    {
      "question": "15.	putting things or animals on fire ",
      "options": ["Yes", "No"],
    },
    {
      "question": "16. Impulsively breaking or throwing things",
      "options": ["Yes", "No"],
    },
    {
      "question": "17. harming or troubling animals?",
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
                Text(
                    "Below given are some Random, but important behavioural issues in children. If any of these if relevant to your child, visiting a psychiatrist is advisable."),
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
