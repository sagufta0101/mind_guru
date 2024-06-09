import 'dart:developer';

import 'package:endurance_app/model/booked_dates_model.dart';
import 'package:endurance_app/presentation/screens/appointment/controller/appointment_ctrl.dart';
import 'package:endurance_app/presentation/screens/appointment/list_appointment.dart';
import 'package:endurance_app/shared/widgets/custom_button.dart';
import 'package:endurance_app/shared/widgets/custom_input.dart';
import 'package:endurance_app/shared/widgets/inputField.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:endurance_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/widgets/functions/custom_time_formatter.dart';

class BookAppointmentPage extends StatefulWidget {
  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  // DateTime? selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final appointmentController = Get.put(AppointmentController());
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: appointmentController.selectedDate.value ?? DateTime.now(),
      firstDate: appointmentController.availableDate.value ??
          DateTime(
              DateTime.now().year, DateTime.now().month, (DateTime.now().day)),
      //  DateTime.now(),
      lastDate: DateTime(
          appointmentController.availableDate.value!.year,
          appointmentController.availableDate.value!.month,
          (appointmentController.availableDate.value!.day + 2)),
    );
    if (picked != null && picked != appointmentController.selectedDate.value) {
      setState(() {
        appointmentController.selectedDate.value = picked;
        dateController.text =
            '${appointmentController.selectedDate.value?.toLocal()}'
                .split(' ')[0];
      });
      // log("selectedDate-----${dateController.text}----${appointmentController.selectedDate.value}");
    }
  }

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (picked != null && picked != selectedTime)
  //     setState(() {
  //       selectedTime = picked;
  //     });
  // }

  // Generate a list of time slots.
  List<TimeSlotsModel> getTimeSlots() {
    List<TimeOfDay> slots = [];
    List<TimeSlotsModel> timeSlots = [];
    for (int hour = 9; hour <= 21; hour++) {
      slots.add(TimeOfDay(hour: hour, minute: 0));
      if (hour != 21) {
        // Prevent adding 9:30 PM slot
        slots.add(TimeOfDay(hour: hour, minute: 30));
      }
    }
    String date = DateFormat('yyyy-MM-dd')
        .format(appointmentController.selectedDate.value ?? DateTime.now());
    List<BookedDates> timelist =
        appointmentController.bookedDateTimeList.value.where((p0) {
      // log("${p0.bookedDate}----------------${p0.bookedTime}");
      return date == p0.bookedDate;
    }).toList();

    if (slots.isNotEmpty) {
      for (TimeOfDay slot in slots) {
        bool? isNotavail = timelist.isNotEmpty
            ? timelist.first.bookedTime
                .where((element) => element == formatTimeInRailway(slot))
                .toList()
                .isNotEmpty
            : false;

        log("message==========${formatTimeInRailway(slot)}----------------$isNotavail");
        timeSlots
            .add(TimeSlotsModel(timeSlot: slot, isNotAvailable: isNotavail));
      }
    }
    // log(timelist.length.toString());
    return timeSlots;
  }

  String formatTimeInRailway(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.Hm();
    return format.format(dt);
  }

  @override
  void initState() {
    setState(() {
      appointmentController.selectedDate.value =
          appointmentController.availableDate.value ?? DateTime.now();
      dateController.text =
          '${appointmentController.selectedDate.value?.toLocal()}'
              .split(' ')[0];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<TimeOfDay> timeSlots = getTimeSlots();
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        titleTextStyle: AvenirTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: CustomColors.blue,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListAppointment(),
                    ));
              },
              icon: Icon(Icons.calendar_month_outlined))
        ],
      ),
      body: Obx(() {
        dateController.text =
            "${appointmentController.selectedDate.value?.toLocal()}"
                .split(' ')[0];
        List<TimeSlotsModel> timeSlots = [];
        if (appointmentController.bookedDateTimeList.isNotEmpty) {
          timeSlots = getTimeSlots();
        }
        return appointmentController.availableDate.value == null
            ? Center(
                child: Text('Doc is not available'),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(
                        hint: 'Select Date',
                        suffix: Icon(Icons.calendar_today),
                        controller: dateController,
                        // initialValue:
                        //     "${appointmentController.selectedDate.value?.toLocal()}"
                        //         .split(' ')[0],
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        borderColor: Colors.grey,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          'Select Time ${"${appointmentController.selectedDate.value?.toLocal()}".split(' ')[0]}'),
                      // Text(appointmentController
                      //     .bookedDateTimeList.last.bookedTime
                      //     .toString()),
                      SizedBox(
                        height: 6,
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          crossAxisSpacing:
                              10, // Horizontal space between items
                          mainAxisSpacing: 10, // Vertical space between items
                          childAspectRatio: 3 / 1, // Aspect ratio of the cards
                        ),
                        shrinkWrap: true,
                        itemCount: timeSlots.length,
                        itemBuilder: (BuildContext context, int index) {
                          TimeSlotsModel slot = timeSlots[index];
                          bool isSelected =
                              selectedTime.hour == slot.timeSlot.hour &&
                                  selectedTime.minute == slot.timeSlot.minute;

                          return GestureDetector(
                            onTap: slot.isNotAvailable
                                ? null
                                : () {
                                    log("available");
                                    Get.dialog(
                                      AlertDialog(
                                        title: Text(
                                            'Before booking kindly call doctor to confirm availability'),
                                        actions: [
                                          // TextButton(
                                          //     onPressed: () {
                                          //       Get.back();
                                          //     },
                                          //     child: Text("Cancel")),
                                          IconButton(
                                              onPressed: () async {
                                                String phoneNumber =
                                                    '+918779662575';
                                                String url = 'tel:$phoneNumber';
                                                if (await canLaunch(url)) {
                                                  await launch(url);
                                                } else {
                                                  throw 'Could not launch $url';
                                                }
                                              },
                                              icon: Icon(
                                                Icons.phone_in_talk_rounded,
                                                size: 30,
                                                color: CustomColors
                                                    .elevatedButtonColor,
                                              )),
                                        ],
                                        // content: SingleChildScrollView(
                                        //   child: Column(
                                        //     mainAxisSize: MainAxisSize.min,
                                        //     children: [

                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ),
                                    );
                                    // String date = DateFormat('yyyy-MM-dd')
                                    //     .format(appointmentController
                                    //             .selectedDate.value ??
                                    //         DateTime.now());
                                    // List<BookedDates> timelist =
                                    //     appointmentController
                                    //         .bookedDateTimeList.value
                                    //         .where((p0) {
                                    //   // log(p0.bookedDate);
                                    //   return date == p0.bookedDate;
                                    // }).toList();
                                    // if (timelist.isNotEmpty) {
                                    //   bool isBooked = timelist.first.bookedTime
                                    //       .where((element) =>
                                    //           element ==
                                    //           formatTimeInRailway(
                                    //               slot.timeSlot))
                                    //       .toList()
                                    //       .isNotEmpty;
                                    //   return;
                                    // }
                                    setState(() {
                                      selectedTime = slot.timeSlot;
                                    });
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                color: slot.isNotAvailable
                                    ? Colors.grey.withOpacity(0.5)
                                    : isSelected
                                        ? CustomColors.elevatedButtonColor
                                            .withOpacity(0.3)
                                        : Colors.white,
                                border: Border.all(
                                  color: isSelected
                                      ? CustomColors.elevatedButtonColor
                                          .withOpacity(0.5)
                                      : Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  formatTimeOfDay(slot.timeSlot),
                                  textAlign: TextAlign
                                      .center, // Make sure the text itself is centered
                                  style: TextStyle(
                                      // If there's any other styling that affects alignment, adjust it here
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Name Input Field

                      InputField(
                        maxLine: 5,
                        controller: noteController,
                        hint: 'Note', minLine: 5,
                        borderColor: Colors.grey,
                        // borderRadius: 22,
                      ),

                      // Book Appointment Button
                      SizedBox(height: 50),
                      CustomElevatedButton(
                          height: 60,
                          buttonText: 'Book Appointment',
                          buttonColor: CustomColors.elevatedButtonColor,
                          onPressed: () async {
                            if (appointmentController.selectedDate.value !=
                                null) {
                              String formattedTime = convertTo24HourFormat(
                                  appointmentController.selectedDate.value!,
                                  selectedTime);
                              // log(formattedTime);
                              // return;
                              bool isDone =
                                  await appointmentController.createAppointment(
                                      formattedTime, noteController.text);
                              if (isDone) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListAppointment(),
                                    ));
                              }
                            }
                          },
                          style: Theme.of(context).textTheme.labelMedium)
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
