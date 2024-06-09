import 'package:endurance_app/model/profile_model.dart';
import 'package:endurance_app/presentation/screens/moodTracking/mood_tracking_view.dart';
import 'package:endurance_app/presentation/screens/profile/controller/profile_controller.dart';
import 'package:endurance_app/presentation/screens/profile/survey_listing.dart';
import 'package:endurance_app/presentation/screens/profile/surveyforms/depression_form.dart';
import 'package:endurance_app/presentation/screens/profile/surveyforms/severity_depression_landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/route_constant.dart';
import '../../../shared/widgets/bigger_appbar.dart';
import '../appointment/list_appointment.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool switchKey = false;
  final profileController = Get.put(ProfileTabController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Obx(() {
              return OrangeAppbar(
                  profileInfo: profileController.profileData.isEmpty
                      ? Patient(
                          firstName: 'User',
                          lastName: '',
                          dateOfBirth: DateTime.now(),
                          address: '',
                          medicalIssue: '')
                      : profileController.profileData.first.patient);
            }),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade100,
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListAppointment(),
                            ));
                      },
                      leading: Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                      title: Text('Appointment History'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade100,
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoodTrackerHomePage(),
                            ));
                      },
                      leading: Icon(
                        Icons.mood,
                        color: Colors.grey,
                      ),
                      title: Text('Mood Tracking'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                  // Card(
                  //   margin: EdgeInsets.symmetric(vertical: 10),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10)),
                  //   shadowColor: Colors.grey.shade100,
                  //   elevation: 3,
                  //   child: ListTile(
                  //     leading: Icon(
                  //       Icons.more_time_rounded,
                  //       color: Colors.grey,
                  //     ),
                  //     title: Text('Availability'),
                  //     trailing: Switch(
                  //       value: switchKey,
                  //       activeColor: AppColor.green,
                  //       onChanged: (value) {
                  //         switchKey = value;
                  //         setState(() {});
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade100,
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    // DepressionForm(),
                                    // DepressionFormLanding()
                                    SurveyListingPage()));
                      },
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.grey,
                      ),
                      title: Text('Survey form'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade100,
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        GetStorage().write('isLogin', false);
                        Get.offAndToNamed(AppRoutes.login);
                      },
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.grey,
                      ),
                      title: Text('Logout'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
