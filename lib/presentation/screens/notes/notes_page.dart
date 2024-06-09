import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:endurance_app/presentation/screens/notes/note_ctrl.dart';
import 'package:endurance_app/shared/widgets/functions/custom_time_formatter.dart';
import 'package:endurance_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/route_constant.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/date_selection.dart';
import '../../../shared/widgets/inputField.dart';
import '../../../theme/colors.dart';

class NotesPage extends StatefulWidget {
  NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  DateTime selectedDate = DateTime.now();
  final noteCtrl = TextEditingController();
  late ScrollController _controller;
  final noteController = Get.put(NoteController());
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Notes',
          style: AvenirTextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CustomColors.blue,
        elevation: 0,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.dialog(
        //           AlertDialog(
        //             title: Text(
        //                 'Add Your Note for ${DateFormat('yyyy-MM-dd').format(selectedDate)} - ${DateFormat.jm().format(DateTime.now())}'),
        //             content: SingleChildScrollView(
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   InputField(
        //                     maxLine: 5,
        //                     // controller: noteController,
        //                     hint: 'Note',
        //                     minLine: 3,
        //                     controller: noteCtrl,
        //                     borderColor: Colors.grey,
        //                     // borderRadius: 22,
        //                   ),
        //                   SizedBox(
        //                     height: 15,
        //                   ),
        //                   CustomElevatedButton(
        //                       buttonText: 'Submit',
        //                       buttonColor: CustomColors.elevatedButtonColor,
        //                       onPressed: () {
        //                         String timestamp = convertTo24HourFormat(
        //                             selectedDate, TimeOfDay.now());
        //                         noteController.createNote(
        //                             timestamp, noteCtrl.text);
        //                       },
        //                       style: Theme.of(context).textTheme.labelMedium)
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //       icon: Icon(Icons.note_add_outlined))
        // ],
        leading: IconButton(
            onPressed: () {
              log("message");
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: Text(
                  'Add Your Note for ${DateFormat('yyyy-MM-dd').format(selectedDate)} - ${DateFormat.jm().format(DateTime.now())}'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    InputField(
                      maxLine: 5,
                      // controller: noteController,
                      hint: 'Note',
                      minLine: 3,
                      controller: noteCtrl,
                      borderColor: Colors.grey,
                      // borderRadius: 22,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomElevatedButton(
                        buttonText: 'Submit',
                        buttonColor: CustomColors.elevatedButtonColor,
                        onPressed: () {
                          String timestamp = convertTo24HourFormat(
                              selectedDate, TimeOfDay.now());
                          noteController.createNote(timestamp, noteCtrl.text);
                        },
                        style: Theme.of(context).textTheme.labelMedium)
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
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
              Obx(() {
                return !noteController.isLoading.value
                    ? SingleChildScrollView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 10,
                          children: List.generate(
                              DateTime(selectedDate.year,
                                      selectedDate.month + 1, 0)
                                  .day, (index) {
                            bool isCheck =
                                noteController.scheduleList.where((p0) {
                              return (DateTime.parse(p0.date).day ==
                                      index + 1 &&
                                  DateTime.parse(p0.date).month ==
                                      selectedDate.month &&
                                  DateTime.parse(p0.date).year ==
                                      selectedDate.year);
                            }).isNotEmpty;

                            return DaySelection(
                              isData: isCheck,
                              // dateScheduleList:
                              //     noteController.dateScheduleList.value,
                              selectedDate: selectedDate,
                              day: index + 1,
                              // isData: ,
                              onTap: () {
                                log(index.toString());
                                selectedDate = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  index + 1,
                                );
                                setState(() {});
                                noteController
                                    .getNotesBasedOnDate(selectedDate);
                              },
                            );
                          }),
                        ),
                      )
                    : Container();
              }),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text('Notes'),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      return SingleChildScrollView(
                        child: Column(
                          children: noteController.dateScheduleList
                              .map(
                                (note) => Container(
                                  margin: EdgeInsets.only(
                                    bottom: size.height * 0.03,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(DateFormat.jm()
                                            .format(note.timestamp)),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          width: size.width,
                                          // height: size.height * 0.05,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: CustomColors.lightblue
                                                  .withOpacity(0.12)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              note.description ??
                                                  'I slept at 12 PM',
                                              style: AvenirTextStyle(
                                                  color: CustomColors.blue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    })
                    // SizedBox(
                    //   height: size.height * 0.03,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Theme.of(context).backgroundColor,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(18.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('Time'),
                    //         SizedBox(
                    //           height: 16,
                    //         ),
                    //         Container(
                    //           width: size.width,
                    //           // height: size.height * 0.05,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(7),
                    //               color:
                    //                   CustomColors.lightblue.withOpacity(0.12)),
                    //           child: Center(
                    //               child: Padding(
                    //             padding: const EdgeInsets.all(12.0),
                    //             child: Text(
                    //               'Slept with a headache',
                    //               style: AvenirTextStyle(
                    //                   color: CustomColors.blue,
                    //                   fontSize: 15,
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //           )),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: size.height * 0.03,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Theme.of(context).backgroundColor,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(18.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('Wake Up Notes'),
                    //         SizedBox(
                    //           height: 16,
                    //         ),
                    //         Container(
                    //           width: size.width,
                    //           // height: size.height * 0.05,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(7),
                    //               color:
                    //                   CustomColors.lightblue.withOpacity(0.12)),
                    //           child: Center(
                    //               child: Padding(
                    //             padding: const EdgeInsets.all(12.0),
                    //             child: Text(
                    //               'Woke with a little headache',
                    //               style: AvenirTextStyle(
                    //                   color: CustomColors.blue,
                    //                   fontSize: 15,
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //           )),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
