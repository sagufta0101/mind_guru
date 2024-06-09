import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlcoholFormLanding extends StatefulWidget {
  AlcoholFormLanding({super.key});

  @override
  State<AlcoholFormLanding> createState() => _AlcoholFormLandingState();
}

class _AlcoholFormLandingState extends State<AlcoholFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'alcohol',
              // isFirst: false,
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question":
          "1. Have you ever thought that you should reduce your drug/ alcohol use ?   ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "2.  Have you ever felt irritated by people poking you for your drug/ alcohol use ?",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "3. were Have you ever felt ashamed or apologetic about your drug / alcohol use ?",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "4. did you ever require drug / alcohol first thing in morning to overcome yesterday night effects of its use ?",
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
                Text("Alcohol / Drug addiction screening questions"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "drug = Alcohol, Tobacco, Bhang-Ganja, Brown sugar, Smack, or other.",
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}
