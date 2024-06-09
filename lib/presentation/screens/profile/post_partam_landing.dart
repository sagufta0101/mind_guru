import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostPartamFormLanding extends StatefulWidget {
  PostPartamFormLanding({super.key});

  @override
  State<PostPartamFormLanding> createState() => _PostPartamFormLandingState();
}

class _PostPartamFormLandingState extends State<PostPartamFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'post_partum',
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question":
          "After the delivery of child, have you been experiencing the following ?\n\n\n1. Getting less feeling/ emotions for child",
      "options": ["Yes", "No"],
    },
    {
      "question": "2. Not feeling like breast feeding the baby",
      "options": ["Yes", "No"],
    },
    {
      "question": "3. Not feeling like taking care of it",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "4. Getting Negative emotions for baby, which may be sometimes life threatening",
      "options": ["Yes", "No"],
    },
    {
      "question": "5. Unexplained anxiety or panic episodes",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "6. Not getting enough sleep, even when there is no disturbance",
      "options": ["Yes", "No"],
    },
    {
      "question": "7. Fearing things, starting to suspecting family members",
      "options": ["Yes", "No"],
    },
    {
      "question":
          "8. Taking to self or hearing of voices that others cannot hear",
      "options": ["Yes", "No"],
    },
    {
      "question": "9. frequently crying or Irritable",
      "options": ["Yes", "No"],
    },
    {
      "question": "10. low self confidence",
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
                Text("""POST PARTUM Psychiatic issues
It can start any time soon after delivery, usually is starts somewhere between 2 days to 6 months post delivery
"""),
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
