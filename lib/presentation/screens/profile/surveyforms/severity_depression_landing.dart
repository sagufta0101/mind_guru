import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DepressionFormLanding extends StatefulWidget {
  DepressionFormLanding({super.key});

  @override
  State<DepressionFormLanding> createState() => _DepressionFormLandingState();
}

class _DepressionFormLandingState extends State<DepressionFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'severity_depression',
              // isFirst: true,
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      'question':
          'Little interest or pleasure in doing things\n\nकाम में दिलचिस्पी / रूचि काम होना  (नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Feeling down, depressed, or hopeless\n\n(नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Trouble falling or staying asleep, or sleeping too much\n\nनींद लगाने में परेशानी होती है  / या लगाने के बाद मध्य में बार-बार खोलती है / या ज़यादा नींद आती है (नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Feeling tired or having little energy\n\nदिनभर थकान या सुस्ती रहती है (नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Poor appetite or overeating\n\nभूख कम या ज़यादा लगाती है (नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Feeling bad about yourself - or that you are a failure or have let yourself or your family down\n\nमन खुद को दोषी/ नाकामियाब मानता है , "मेरी वजह से परिवार को अत्यधिक ठेस पहुंची है"- (नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Trouble concentrating on things, such as reading the newspaper or watching television\n\nध्यान एकाग्र करने में दिक्कत ( किताबे / समाचार पेपर पड़ने में दिक्कत, या किसी की बात सुनते-सुनते भटक जाना ) - (नहीं हुई, हाँ कुछ दिन, हाँ आधे से ज़्यादा दिन, हाँ, लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Moving or speaking so slowly that other people could have noticed Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual \n\nधीमा या बैचेनी पूर्वक व्यव्हार करना - (नहीं हुई, हाँ- कुछ दिन, हाँ- आधे से ज़्यादा दिन, हाँ- लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          'Thoughts that you would be better off dead, or of hurting yourself \n\n"अगर जीवित ना रहता तो ही बेहतर था" ऐसे विचार आना  (नहीं हुई, हाँ- कुछ दिन, हाँ- आधे से ज़्यादा दिन, हाँ- लगभद रोज )',
      "type": "single",
      'options': [
        'Not at all\nबिल्कुल नहीं',
        'Several days\nकई दिन',
        'More than half the days\nआधे से ज्यादा दिन',
        'Nearly every day\nलगभग हर दिन'
      ],
    },
    {
      'question':
          '10.	If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people? \n\nइन परेशानियों के चलते आपको घर/ समाज/ कार्यस्थल / पढाई में कितनी दिक्कत का सामना करना पड रहा है ',
      "type": "single",
      'options': [
        'Not difficult at all\nकोई दिक्कत नहीं हुई',
        'somewhat difficult\nथोड़ी दिक्कत हुई',
        'very difficult\nबहुत दिक्कत हुई',
        'extremely difficult\nअत्यधिक दिक्कतों के चलते काम बिगड़ गया'
      ],
    },
    // Add more questions if needed
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
                Text("Lets track your mood"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '''Online screening tools are not diagnostic instruments. You are encouraged to share your results with a physician or healthcare provider. Endurance mind clinic, Dr. Ashvin Chouhan, author, associates, head, sponsors, partners, and advertisers disclaim any liability, loss, or risk incurred as a consequence, directly or indirectly, from the use and application of these screens.''',
                  textAlign: TextAlign.center,
                )
              ]),
        ),
      ),
    );
  }
}
