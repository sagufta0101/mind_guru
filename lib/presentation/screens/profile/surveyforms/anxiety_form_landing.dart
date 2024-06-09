import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnxietyFormLanding extends StatefulWidget {
  AnxietyFormLanding({super.key});

  @override
  State<AnxietyFormLanding> createState() => _AnxietyFormLandingState();
}

class _AnxietyFormLandingState extends State<AnxietyFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'anxiety',
              // isFirst: false,
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question":
          "how often have you been bothered by the following problems?\n	पिछले 2  हफ़्तों में, क्या आपको निम्नलिखित सम्बंधित परेशानियां हुई है ?\nFeeling nervous, anxious, or on edge\nबैचैनी, घबराहट एवं जल्दबाजी में रहना ",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    },
    {
      "question":
          "Not being able to stop or control worrying\n\nअपनी चिंताओं पर अंकुश ना लगा पाना ",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    },
    {
      "question":
          "Worrying too much about different things\n\nकई सारी चीज़ों के बारे में चिंता करने लग जाना",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    },
    {
      "question": "Trouble relaxing\n\nआराम ना महसूस कर पाना ",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    },
    {
      "question":
          "Being so restless that it is hard to sit still\n\n	इतना विचलित रहना की एक जगह आराम से बैठ भी ना पाना ",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    },
    {
      "question":
          "Becoming easily annoyed or irritable\n\nआसानी से चीड़ जाना या नाराज हो जाना",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    },
    {
      "question":
          "Feeling afraid, as if something awful might happen\n\nभयभीत रहना की कुछ गलत ना हो जाये ",
      "options": [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day"
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Self Assessment form"),
              Text("Lets track your anxiety"),
            ]),
      ),
    );
  }
}
