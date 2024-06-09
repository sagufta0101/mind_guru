import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BipolarFormLanding extends StatefulWidget {
  BipolarFormLanding({super.key});

  @override
  State<BipolarFormLanding> createState() => _BipolarFormLandingState();
}

class _BipolarFormLandingState extends State<BipolarFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'bipolar',
              // isFirst: false,
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question":
          "1. Ever in the past, was there been a period of time when you felt so Good or hyper that it got you into trouble?\n\n	क्या कभी आपको कुछ दिनों के लिए ज़रूरत से ज़्यादा और सामान्य से अधिक उत्साह महसूस हुआ है जिसकी वजह से आपके लिए परेशानी खड़ी हो गई हो ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1a. Your mood was so irritable, that you unnecessarily started arguments with people?\n\n	आप चिड़चिड़ाहट के कारण लोगों से लड़ने- भिड़ने लगते ?",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1b. Your confidence risen too much ?\n\n	आपको सामान्य से अत्यधिक आत्मविश्वास होने लगा ?",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1c.	Your sleep requirement reduced drastically ?\n\n	आपको सामान्य से कम नींद की ज़रूरत लगने लगी ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1d. You would talk More and Lauder than necessary ? \n\n	आप सामान्य से ज़्यादा और तेज बोलने लगे हो ??",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1e.	Speed of your Thoughts increased and you could not control them ?\n\n	आपके दिमाग में अत्यधिक तेज़ी से ख्याल आते और आपका उनपर नियंत्रण नहीं रहता ?",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1f.	You would easily be distracted and had trouble focusing on things ?\n\n	क्या आप आसानी से विचलित हो जाते और ध्यान केंद्रित करने में मुश्किल होती ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1g.	Your energy levels Risen drastically ?\n\n	अत्यधिक ताकत और साहस का अनुभव होता ?",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1h.	You would want to socialize more and this would even disturb others, eg. you would telephone your relatives/ friends in midnight? \n\n	क्या आप अत्यधिक सामाजिक होने लगे? जैसे किसी मित्र को आधी रात को फ़ोन लगाना ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1i.	You would desire more sex than usual ?\n\n	क्या सम्भोग करने की इच्छा अत्यधिक होने लगी ?",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1j.	You did unusual things, which people would call risky, foolish ? \n\n	 क्या आप जोखिम भरा काम करने लगे ? जिससे अन्य लोग दूर रहते है। ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "1k.	Over spending money would got you or your family into trouble ?\n\n	अत्यधिक पैसा खर्च करने लगे या ऐसी चीज़ें खरीदने लगे जिसकी आवश्यकता ना हो ",
      "options": ["Yes", "No"]
    },
    {
      "question":
          "2. If you marked YES to more than one of the above, have several of these ever happened during the same period of time together?\n\n	क्या ऊपर दिए गए लक्षणों में २ से ज़्यादा लक्षण एक साथ अनुभव करें है ?",
      // "j.	Over spending money would got you or your family into trouble ?",
      "options": ["Yes", "No"]
    },
    {
      "question": """3. How much of a trouble did any of these cause you?
	Like unable to work; having family, monetary or legal troubles; getting into unnecessary arguments or fights etc ?\n\nलक्षणों के कारण क्या आपको नुक्सान हुआ ?\nजैसे की आर्थिक / पारिवारिक / राजनैतिक / कानूनी इत्यादि 
""",
      "options": [
        "NO PROBLEM",
        "MINOR PROBLEM",
        "MODERATE PROBLEM",
        "SERIOUS PROBLEM",
        "NO",
      ]
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
                Text("Lets track your Bipolar Disorder"),
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
