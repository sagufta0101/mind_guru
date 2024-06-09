import 'dart:developer';

import 'package:endurance_app/presentation/screens/home/home_tab_ctrl.dart';
import 'package:endurance_app/shared/widgets/custom_button.dart';
import 'package:endurance_app/shared/widgets/mood_tracker_dialog.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:endurance_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../main.dart';
import '../../../routes/route_constant.dart';
import '../calender/calender_tab_ctrl.dart';
import '../moodTracking/mood_tracking_view.dart';
import 'widgets/day_report.dart';
import 'widgets/week_report.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final homeController = Get.put(HomeTabController());
  final calenderController = Get.put(CalenderTabController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.noteRoute);
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                homeController.getDailyMoodTrackingReport();
              },
              icon: Icon(Icons.refresh))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 60.0,
                          circularStrokeCap: CircularStrokeCap.round,
                          lineWidth: 15.0,
                          startAngle: 90,
                          percent: (homeController.analytics.value
                                      ?.medicineTakenPercentage ??
                                  0) /
                              100,
                          animateFromLastPercent: true,
                          addAutomaticKeepAlive: true,
                          backgroundColor: Colors.grey.shade300,
                          center: Text(
                              "${homeController.analytics.value?.medicineTakenPercentage?.floor()}%",
                              style: AvenirTextStyle(
                                  color: CustomColors.elevatedButtonColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          progressColor: CustomColors.elevatedButtonColor,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Weekly pill use',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${homeController.analytics.value?.startOfWeek} - ${homeController.analytics.value?.endOfWeek}',
                          // 'June 16 2021 - June 22 2021',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Obx(() {
                    return Column(
                      children: [
                        Text(
                          "Daliy Activity and Mood Tracker",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        homeController.dailyActivityReportList.isNotEmpty
                            ? Column(
                                children: [
                                  Container(
                                      height: 450,
                                      width: MediaQuery.of(context).size.width,
                                      child: ActivityChart(
                                        dailyActivityReportList: homeController
                                            .dailyActivityReportList.value,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "We suggest to perform more of “green activities” and avoid/ modify way of doing of Red Activities"),
                                  )
                                ],
                              )
                            : Container(
                                height: 200,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                          "You havent added mood tracking data yet"),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60.0),
                                        child: CustomElevatedButton(
                                          height: 40,
                                          buttonText: 'Add Your Mood',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                fontSize: 18,
                                              ),
                                          buttonColor:
                                              CustomColors.elevatedButtonColor,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoodTrackerHomePage(),
                                                ));
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        // Container(
                        //   height: 400,
                        //   width: 1000,
                        //   // decoration:
                        //   //     BoxDecoration(color: CustomColors.lightPurple),
                        //   child: SingleChildScrollView(
                        //     scrollDirection: Axis.horizontal,
                        //     child: MoodTrackerChart(),
                        //   ),
                        // ),
                      ],
                    );
                  }),
                  Obx(() {
                    return homeController.weeklyActivityReportList.isNotEmpty
                        ? Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            child: WeeklyMoodReportChart(
                              datalist: homeController
                                      .weeklyActivityReportList.value ??
                                  [],
                            ))
                        : Container();
                  })

                  // Column(
                  //   children: [
                  //     'Monday',
                  //     'Tuesday',
                  //     'Wednesday',
                  //     'Thursday',
                  //     'Friday',
                  //     'Saturday'
                  //   ]
                  //       .map(
                  //         (day) => Padding(
                  //           padding: const EdgeInsets.only(bottom: 20.0),
                  //           child: Align(
                  //             alignment: Alignment.topLeft,
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(12.0),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     '$day, June',
                  //                     style:
                  //                         Theme.of(context).textTheme.bodyLarge,
                  //                   ),
                  //                   SizedBox(
                  //                     height: size.height * 0.03,
                  //                   ),
                  //                   Row(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           Image.asset(
                  //                               'assets/images/oval.png'),
                  //                           Container(
                  //                             height: size.height *
                  //                                 0.036 *
                  //                                 2 *
                  //                                 2, //here 1st twoo will be the length of medicines
                  //                             width: 1.5,
                  //                             color: Colors.grey.shade400,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         width: 10,
                  //                       ),
                  //                       Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             'Missed',
                  //                             style: Theme.of(context)
                  //                                 .textTheme
                  //                                 .titleMedium!
                  //                                 .copyWith(
                  //                                     color:
                  //                                         Colors.grey.shade600),
                  //                           ),
                  //                           Column(
                  //                             children: [9, 10]
                  //                                 .map((e) => Row(
                  //                                       children: [
                  //                                         Padding(
                  //                                           padding:
                  //                                               const EdgeInsets
                  //                                                   .all(8.0),
                  //                                           child: CircleAvatar(
                  //                                             backgroundColor:
                  //                                                 Colors.grey
                  //                                                     .shade200,
                  //                                             radius: 20,
                  //                                             child: Image.asset(
                  //                                                 'assets/images/blue_med.png'),
                  //                                           ),
                  //                                         ),
                  //                                         Text(
                  //                                           'Heart napa, 0$e:00 am',
                  //                                           style: Theme.of(
                  //                                                   context)
                  //                                               .textTheme
                  //                                               .titleMedium!
                  //                                               .copyWith(
                  //                                                   color: Colors
                  //                                                       .grey
                  //                                                       .shade600),
                  //                                         ),
                  //                                       ],
                  //                                     ))
                  //                                 .toList(),
                  //                           )
                  //                         ],
                  //                       )
                  //                     ],
                  //                   ),
                  //                   Row(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           Image.asset(
                  //                               'assets/images/oval.png'),
                  //                           Container(
                  //                             height: size.height *
                  //                                 0.036 *
                  //                                 3 *
                  //                                 2, //3 is the length of medicine
                  //                             width: 1.5,
                  //                             color: Colors.grey.shade400,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         width: 10,
                  //                       ),
                  //                       Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             'Taken',
                  //                             style: Theme.of(context)
                  //                                 .textTheme
                  //                                 .titleMedium!
                  //                                 .copyWith(
                  //                                     color:
                  //                                         Colors.grey.shade600),
                  //                           ),
                  //                           Column(
                  //                             children: [9, 10, 11]
                  //                                 .map((e) => Row(
                  //                                       children: [
                  //                                         Padding(
                  //                                           padding:
                  //                                               const EdgeInsets
                  //                                                   .all(8.0),
                  //                                           child: CircleAvatar(
                  //                                             backgroundColor:
                  //                                                 Colors.grey
                  //                                                     .shade200,
                  //                                             radius: 20,
                  //                                             child: Image.asset(
                  //                                                 'assets/images/blue_med.png'),
                  //                                           ),
                  //                                         ),
                  //                                         Text(
                  //                                           'Heart napa, 09:00 am',
                  //                                           style: Theme.of(
                  //                                                   context)
                  //                                               .textTheme
                  //                                               .titleMedium!
                  //                                               .copyWith(
                  //                                                   color: Colors
                  //                                                       .grey
                  //                                                       .shade600),
                  //                                         ),
                  //                                       ],
                  //                                     ))
                  //                                 .toList(),
                  //                           )
                  //                         ],
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //       .toList(),
                  // )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
