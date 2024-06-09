import 'package:endurance_app/presentation/screens/profile/surveyforms/anxiety_form_landing.dart';
import 'package:endurance_app/presentation/screens/profile/surveyforms/severity_depression_landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../theme/colors.dart';
import '../../../theme/text_style.dart';
import 'adult_adhd_landing.dart';
import 'alcohol_form_landing.dart';
import 'children_behave_landing.dart';
import 'post_partam_landing.dart';
import 'psychosis_form_landing.dart';
import 'surveyforms/bipolar_disorder_landing.dart';
import 'surveyforms/easy_depression_landing.dart';

class SurveyListingPage extends StatelessWidget {
  const SurveyListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        elevation: 0,
        title: Text('Survey Forms'),
        titleTextStyle: AvenirTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepressionFormLanding(),
                    ));
              },
              title: Text("Depression Form (Severity)"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EasyDepressionFormLanding(),
                    ));
              },
              title: Text("Depression Form (Easy)"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnxietyFormLanding(),
                    ));
              },
              title: Text("Anxiety  Form"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BipolarFormLanding(),
                    ));
              },
              title: Text("Bipolar Disorder Form"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PsychosisFormLanding(),
                    ));
              },
              title: Text("Psychosis Form"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlcoholFormLanding(),
                    ));
              },
              title: Text("Alcohol / Drug addiction screening questions"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdultAdhdFormLanding(),
                    ));
              },
              title: Text("Adult ADHD"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChildrenIssuesFormLanding(),
                    ));
              },
              title: Text("Behavioral issues in Children"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostPartamFormLanding(),
                    ));
              },
              title: Text("POST PARTUM Psychiatic issues"),
            ),
          ),
        ],
      ),
    );
  }
}
