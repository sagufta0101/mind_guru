import 'package:endurance_app/presentation/screens/calender/calender_tab_ctrl.dart';
import 'package:endurance_app/presentation/screens/profile/controller/profile_controller.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/date_selection.dart';

class CalenderTab extends StatefulWidget {
  const CalenderTab({super.key});

  @override
  State<CalenderTab> createState() => _CalenderTabState();
}

class _CalenderTabState extends State<CalenderTab> {
  DateTime selectedDate = DateTime.now();
  late ScrollController _controller;
  final profileController = Get.find<ProfileTabController>();
  final calController = Get.put(CalenderTabController());

  @override
  void initState() {
    _controller = ScrollController(
        keepScrollOffset: true,
        initialScrollOffset: (30 *
                (selectedDate.day +
                    (selectedDate.day < 5
                        ? selectedDate.day - 2.5
                        : (selectedDate.day / 10).round() == 1
                            ? selectedDate.day - 2
                            : (selectedDate.day / 10).round() == 2
                                ? selectedDate.day - 1
                                : (selectedDate.day + 1))))
            .toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.lightPurple,
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Hello, ${profileController.profileData.isNotEmpty ? profileController.profileData.first.patient.firstName : "User"}',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: CustomColors.blue),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          //   child: Text(
          //     'Good Morning',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //         color: CustomColors.blue, fontWeight: FontWeight.w600),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.01,
          // ),
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
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
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
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
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
                (index) => DaySelection(
                  selectedDate: selectedDate,
                  day: index + 1,
                  onTap: () {
                    selectedDate = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      index + 1,
                    );
                    setState(() {});
                    calController.getScheduleBasedOnDate(selectedDate);

                    print(selectedDate);
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
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Spacer(),
          Obx(() {
            return Container(
              width: size.width,
              height: size.height * 0.535,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    child: Text('Total Activities'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          //  index / 2 == 0
                          //     ?
                          calController.dateScheduleList[index].istaken == null
                              ? Container(
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade100,
                                            blurRadius: 10,
                                            offset: const Offset(0, 1),
                                            spreadRadius: 7)
                                      ],
                                      color: CustomColors.lightPurple,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                                'assets/images/medicine_1.png'),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(calController
                                                        .dateScheduleList[index]
                                                        .prescriptionDetails
                                                        .medicine ??
                                                    'Aplox'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${calController.dateScheduleList[index].prescriptionDetails.power} mg" ??
                                                      '300 mg, 1 capsule',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Text(
                                                    calController
                                                            .dateScheduleList[
                                                                index]
                                                            .prescriptionDetails
                                                            .instruction ??
                                                        'Before Breakfast',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.timer_sharp,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      'arround ${calController.dateScheduleList[index].prescriptionDetails.time}',
                                                      // '9:00 - 10:00',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Divider(
                                          height: 10,
                                          color: CustomColors.blue
                                              .withOpacity(0.2),
                                          thickness: 2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(),
                                              onPressed: () async {
                                                await calController
                                                    .manageIsTakenStatus(
                                                        false,
                                                        calController
                                                            .dateScheduleList[
                                                                index]
                                                            .id);
                                                calController
                                                    .getScheduleBasedOnDate(
                                                        selectedDate);
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.cancel,
                                                      size: 20,
                                                      color: CustomColors
                                                          .lightblue),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('Skip',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              color: CustomColors
                                                                  .lightblue)),
                                                ],
                                              ),
                                            ),
                                            // Spacer(),
                                            SizedBox(
                                              width: size.width * 0.05,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(),
                                              onPressed: () async {
                                                await calController
                                                    .manageIsTakenStatus(
                                                        true,
                                                        calController
                                                            .dateScheduleList[
                                                                index]
                                                            .id);
                                                calController
                                                    .getScheduleBasedOnDate(
                                                        selectedDate);
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.check,
                                                      size: 20,
                                                      color: CustomColors
                                                          .vibrantBlue),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('Done',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              color: CustomColors
                                                                  .vibrantBlue)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade200,
                                            blurRadius: 10,
                                            offset: const Offset(0, 1),
                                            spreadRadius: 7)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                                'assets/images/medicine_2.png'),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(calController
                                                        .dateScheduleList[index]
                                                        .prescriptionDetails
                                                        .medicine ??
                                                    'Aplox'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${calController.dateScheduleList[index].prescriptionDetails.power} mg" ??
                                                      '300 mg, 1 capsule',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Text(
                                                    calController
                                                            .dateScheduleList[
                                                                index]
                                                            .prescriptionDetails
                                                            .instruction ??
                                                        'Before Breakfast',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.timer_sharp,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      ' arround ${calController.dateScheduleList[index].prescriptionDetails.time}',
                                                      // '9:00 - 10:00',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                      shrinkWrap: true,
                      itemCount: calController.dateScheduleList.length,
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
