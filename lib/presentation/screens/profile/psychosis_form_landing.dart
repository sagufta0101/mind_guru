import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PsychosisFormLanding extends StatefulWidget {
  PsychosisFormLanding({super.key});

  @override
  State<PsychosisFormLanding> createState() => _PsychosisFormLandingState();
}

class _PsychosisFormLandingState extends State<PsychosisFormLanding> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionForm(
              questions: depressionQuestions,
              formType: 'psychosis',
              // isFirst: false,
            ),
          ));
    });
    super.initState();
  }

  List<Map<String, dynamic>> depressionQuestions = [
    {
      "question":
          "1.	Do familiar surroundings sometimes seem strange, confusing, threatening or unreal to you ?\n\nक्या आस पास का जाना-माना वातावरण आपको अजीब / डरावना / भ्रामक प्रतीत होने लगता है ?",
      "isoptional": false,
      "options": ["Yes", "No"]
    },
    {
      "question":
          "2.	Have you heard unusual sounds like banging, clicking, hissing, clapping or ringing in your ears?\n\nक्या आपको आपने आस-पास अजीब सी आवाज़ सुनाई पड़ती है ? जैसे ठोकना / घिसटना / घंटी      बजना / पीटना इत्यादि। ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "3.	Do things that you see appear different from the way they usually do (brighter or duller, larger or smaller, or changed in some other way)?\n\nक्या आपको लगता है की चीज़ों का वास्तविक स्वरुप बदल गया है , जैसे उनका आकर,   उनका रंग इत्यादि  ",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "4.	Have you had experiences with telepathy, psychic forces, or fortune telling?  \n\nक्या आपको टेलीपैथी, मानसिक शक्तियों या भाग्य बताने का अनुभव हुआ है?",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "5.	Have you felt that you are not in control of your own ideas or thoughts? \n\nक्या आपको महसूस हुआ है की आपके विचार या खयाल आपके नियंत्रण में नहीं है ?",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "6.	Do you have difficulty getting your point across, because you ramble or go off the track a lot when you talk?\n\nक्या आपकी स्पष्ट बात करने की क्षमता काम हो गई है ",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "7.	Do you have strong feelings or beliefs about being unusually gifted or talented in some way?\n\nक्या आपको ऐसा अनुभव हुआ है की आपके पास दैविक शक्ति है या भगवान् की ताकत है ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "8. Do you feel that other people are watching you or talking about you? \n\nक्या आपको लगता है की लोग आपके ऊपर नज़र रखतें है या आपके बारे में पीठ पीछे बातें करते है ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "9.	Do you sometimes get strange feelings on or just beneath your skin, like bugs crawling? \n\nक्या आपको कभी अपनी चमड़ी के निचे कुछ अजीब सा महसूस होता है ? जैसे की कीड़े चल रहे हो ?",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "10.	Do you sometimes feel suddenly distracted by distant sounds that you are not normally aware of? \n\nक्या आप कभी दूर से अचानक आने वाली आवाज़ों से डर जाया करें है ",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "1j.	You did unusual things, which people would call risky, foolish ? \n\nक्या आप अपने आस पास किसी शक्ति या किसी व्यक्ति के होने का आभास कर सकतें है ? भले ही वो दिखाई ना दें ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "11.	 Have you had the sense that some person or force is around you, although you couldn’t see anyone? \n",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "12.	Do you worry at times that something may be wrong with your mind? ",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "13.	Have you ever felt that you don't exist, the world does not exist, or that you are dead? ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "14.	 Have you been confused at times whether something you experienced was real or imaginary? ",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "15.	Do you hold beliefs that other people would find unusual or bizarre? ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "16.	Do you feel that parts of your body have changed in some way, or that parts of your body are working differently? ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "17.	Are your thoughts sometimes so strong that you can almost hear them? ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "18.	Do you find yourself feeling mistrustful or suspicious of other people? ",
      "options": ["Yes", "No"],
      "isoptional": true,
    },
    {
      "question":
          "19.	Have you seen unusual things like flashes, flames, blinding light, or geometric figures? ",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "20.	Have you seen things that other people can't see or don't seem to see",
      "options": ["Yes", "No"],
      "isoptional": false,
    },
    {
      "question":
          "21.	Do people sometimes find it hard to understand what you are saying?",
      "options": ["Yes", "No"],
      "isoptional": true,
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
