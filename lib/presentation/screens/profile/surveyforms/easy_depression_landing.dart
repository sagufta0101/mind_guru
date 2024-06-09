import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EasyDepressionFormLanding extends StatefulWidget {
  EasyDepressionFormLanding({super.key});

  @override
  State<EasyDepressionFormLanding> createState() =>
      _EasyDepressionFormLandingState();
}

class _EasyDepressionFormLandingState extends State<EasyDepressionFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'easy_depression',
              // isFirst: true,
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      'question':
          'In past 2 weeks, for most days and most of the time, did you have any of the following ?\n\nक्या पिछले 2 हफ्तों में, लगभग रोजाना,  अधिकतर समय तक, आपको आगे दिए लक्षण महसूस हुऐ है ?',
      "type": "multiple",
      'options': [
        'persistent sadness or low mood\nलगातार मायूसी या उदासी महसूस करना ',
        'loss of interests or pleasure\nजीवन में उत्सुकता और आनंद की कमी लगाना ',
        'fatigue or low energy\nजल्दी थकना या कमज़ोरी लगाना ',
        'disturbed sleep\nनींद अत्यधिक ज़्यादा या कम होना ',
        'poor concentration or indecisiveness\nएकाग्रता में कमी या निर्णय लेने की क्षमता में कमी होना ',
        'low self-confidence\nआत्मविश्वास में कमी लगाना ',
        'poor or increased appetite\nभूख प्यास में कमी या अत्यधिक लगाना',
        'suicidal thoughts or acts\nख़ुदकुशी / आत्महत्या के विचार या व्यव्हार ',
        'agitation or slowing of movements\nअत्यधिक ग़ुस्सा या अत्यधिक धीमा होना ',
        'Feeling over guilty or excessive self-blaming,\nकिसी स्थिति के लिए स्वयं को अत्यधिक दोषी या अपराधी मानना '
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
                // Text(
                //   '''Online screening tools are not diagnostic instruments. You are encouraged to share your results with a physician or healthcare provider. Endurance mind clinic, Dr. Ashvin Chouhan, author, associates, head, sponsors, partners, and advertisers disclaim any liability, loss, or risk incurred as a consequence, directly or indirectly, from the use and application of these screens.''',
                //   textAlign: TextAlign.center,
                // )
              ]),
        ),
      ),
    );
  }
}
