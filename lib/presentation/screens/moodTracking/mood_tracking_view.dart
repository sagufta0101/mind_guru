import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:endurance_app/presentation/screens/moodTracking/controller/mood_tracking_controller.dart';
import 'package:endurance_app/shared/widgets/functions/custom_time_formatter.dart';
import 'package:endurance_app/shared/widgets/mood_tracker_dialog.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/date_selection.dart';
import '../../../theme/text_style.dart';

class MoodTrackerHomePage extends StatefulWidget {
  const MoodTrackerHomePage({super.key});

  @override
  State<MoodTrackerHomePage> createState() => _MoodTrackerHomePageState();
}

class _MoodTrackerHomePageState extends State<MoodTrackerHomePage> {
  DateTime selectedDate = DateTime.now();
  final moodTrackingCtrl = Get.put(MoodTrackingController());
  late ScrollController _controller;
  double moodRating = 3;
  TextEditingController noteController = TextEditingController();
  // List<TimeOfDay> timeSlots = [];

  // List<TimeOfDay> getTimeSlots() {
  //   List<TimeOfDay> slots = [];
  //   for (int hour = 7; hour <= 24; hour++) {
  //     slots.add(TimeOfDay(hour: hour, minute: 0));
  //     // if (hour != 21) {
  //     //   // Prevent adding 9:30 PM slot
  //     //   slots.add(TimeOfDay(hour: hour, minute: 30));
  //     // }
  //   }
  //   return slots;
  // }

  @override
  void initState() {
    // TODO: implement initState
    // timeSlots = getTimeSlots();
    _controller = ScrollController(
        keepScrollOffset: true,
        initialScrollOffset: (23 *
                (selectedDate.day +
                    (selectedDate.day < 5
                        ? selectedDate.day - 2.5
                        : (selectedDate.day / 10).round() == 1
                            ? selectedDate.day - 2
                            : (selectedDate.day / 10).round() == 2
                                ? selectedDate.day - 1
                                : (selectedDate.day + 1))))
            .toDouble());
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Mood Tracking',
          style: AvenirTextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CustomColors.blue,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              transform: Matrix4.translationValues(-15, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      if (selectedDate.month != 1) {
                        selectedDate = DateTime(
                          selectedDate.year,
                          selectedDate.month - 1,
                          selectedDate.day,
                        );
                        setState(() {});
                      } else {
                        selectedDate = DateTime(
                          selectedDate.year - 1,
                          12,
                          selectedDate.day,
                        );
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.3),
                      size: 15,
                    ),
                  ),
                  Text(
                    formatDate(selectedDate, [MM, "  ", yyyy]),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (selectedDate.month != 12) {
                        selectedDate = DateTime(
                          selectedDate.year,
                          selectedDate.month + 1,
                          selectedDate.day,
                        );
                        setState(() {});
                      } else {
                        selectedDate = DateTime(
                          selectedDate.year + 1,
                          1,
                          selectedDate.day,
                        );
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.3),
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: List.generate(
                  DateTime(selectedDate.year, selectedDate.month + 1, 0).day,
                  (index) => DaySelectionForMood(
                    selectedDate: selectedDate,
                    day: index + 1,
                    onTap: () {
                      selectedDate = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        index + 1,
                      );
                      setState(() {});
                      print(selectedDate);
                      moodTrackingCtrl.getMoodDataBasedOnDate(selectedDate);
                      // selectedDate =
                      //     "${selectedDate.year}-${(selectedDate.month).toString().padLeft(2, '0')}-${selectedDate.day}";
                      // entertainmentController.getCalenderData(
                      //     entertainmentController
                      //         .selectedDate.value);
                    },
                  ),
                ),
              ),
            ),
            Obx(() {
              return Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(12),
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: size.width * 2,
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(color: CustomColors.lightPurple),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Time Slots"),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: size.width * 0.1),
                              //   child: Text("Add/Delete"),
                              // ),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.1),
                                child: Text("Mood Rt."),
                              ),
                              Expanded(child: Text("Acttions")),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: moodTrackingCtrl
                                    .moodTrackingCalenderList
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(formatTimeOfDay(e.timeSlot)),
                                              if (e.moodData == null)
                                                InkWell(
                                                  onTap: () {
                                                    addMoodTrackingDialog(
                                                        formatTimeOfDay(
                                                            e.timeSlot),
                                                        formatTimeOfDay(
                                                            TimeOfDay(
                                                                hour: e.timeSlot
                                                                        .hour +
                                                                    1,
                                                                minute: 0)),
                                                        context,
                                                        moodRating,
                                                        noteController,
                                                        (rating) {
                                                      setState(() {
                                                        moodRating = rating;
                                                      });
                                                    }, () {
                                                      log(moodRating
                                                          .toString());

                                                      moodTrackingCtrl.createMood(
                                                          convertTo24HourFormat(
                                                              selectedDate,
                                                              e.timeSlot),
                                                          noteController.text,
                                                          moodRating
                                                              .toString());
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: CustomColors
                                                        .vibrantBlue,
                                                    size: 20,
                                                  ),
                                                ),
                                              // Icon(
                                              //   size: 20,
                                              //   Icons.delete,
                                              //   color:
                                              //       CustomColors.elevatedButtonColor,
                                              // ),
                                            ],
                                          ),
                                        ))
                                    .toList()),
                            // SizedBox(
                            //   width: size.width * 0.15,
                            // ),

                            SizedBox(
                              width: size.width * 0.17,
                            ),
                            Column(
                                children: moodTrackingCtrl
                                    .moodTrackingCalenderList
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.5, horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                e.moodData?.rating.toString() ??
                                                    '-',
                                                style: TextStyle(
                                                    color: e.moodData?.rating !=
                                                            null
                                                        ? Colors.green
                                                        : Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList()),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: moodTrackingCtrl
                                      .moodTrackingCalenderList
                                      .map((e) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20.50),
                                            child: Text(
                                              e.moodData?.activities ??
                                                  'No Entry',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color:
                                                      e.moodData?.activities !=
                                                              null
                                                          ? Colors.green
                                                          : Colors.grey),
                                            ),
                                          ))
                                      .toList()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
