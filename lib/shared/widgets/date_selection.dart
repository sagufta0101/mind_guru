import 'dart:developer';

import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../model/notes_model.dart';

class DaySelection extends StatefulWidget {
  final DateTime selectedDate;
  final int day;
  // List<NoteData>? dateScheduleList;
  bool isData;
  final Function() onTap;

  DaySelection({
    required this.selectedDate,
    required this.day,
    // this.dateScheduleList,
    this.isData = false,
    required this.onTap,
  });

  @override
  State<DaySelection> createState() => _DaySelectionState();
}

class _DaySelectionState extends State<DaySelection> {
  bool isData = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: size.height * 0.03),
            decoration: BoxDecoration(
              color: widget.selectedDate.day == widget.day
                  ? CustomColors.blue
                  // ? Theme.of(context).primaryColorLight
                  : Colors.white,
              // : Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  "${widget.day}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22,
                        color: widget.selectedDate.day == widget.day
                            ? Colors.white
                            // ? Theme.of(context).primaryColorDark
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  DateTime(widget.selectedDate.year, widget.selectedDate.month,
                                  widget.day)
                              .weekday ==
                          DateTime.saturday
                      ? "Sat"
                      : DateTime(widget.selectedDate.year,
                                      widget.selectedDate.month, widget.day)
                                  .weekday ==
                              DateTime.sunday
                          ? "Sun"
                          : DateTime(widget.selectedDate.year,
                                          widget.selectedDate.month, widget.day)
                                      .weekday ==
                                  DateTime.monday
                              ? "Mon"
                              : DateTime(
                                              widget.selectedDate.year,
                                              widget.selectedDate.month,
                                              widget.day)
                                          .weekday ==
                                      DateTime.tuesday
                                  ? "Tue"
                                  : DateTime(
                                                  widget.selectedDate.year,
                                                  widget.selectedDate.month,
                                                  widget.day)
                                              .weekday ==
                                          DateTime.wednesday
                                      ? "Wed"
                                      : DateTime(
                                                      widget.selectedDate.year,
                                                      widget.selectedDate.month,
                                                      widget.day)
                                                  .weekday ==
                                              DateTime.thursday
                                          ? "Thu"
                                          : DateTime(
                                                          widget.selectedDate
                                                              .year,
                                                          widget.selectedDate
                                                              .month,
                                                          widget.day)
                                                      .weekday ==
                                                  DateTime.friday
                                              ? "Fri"
                                              : "",
                  style: TextStyle(
                    fontSize: 12,
                    color: widget.selectedDate.day == widget.day
                        ? Colors.white
                        // ? Theme.of(context).primaryColorDark
                        : Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // CircleAvatar(
                //   radius: 15,
                //   backgroundColor: Theme.of(context).primaryColorDark,
                //   child: FittedBox(
                //     fit: BoxFit.scaleDown,
                //     child:
                //     Text(
                //       "$day",
                //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                //             fontSize: 12,
                //             fontWeight: FontWeight.w600,
                //           ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // if (dateScheduleList != null)
          if (widget.isData)
            CircleAvatar(
              radius: 5,
            )
        ],
      ),
    );
  }
}

class DaySelectionForMood extends StatelessWidget {
  final DateTime selectedDate;
  final int day;
  final Function() onTap;

  const DaySelectionForMood({
    required this.selectedDate,
    required this.day,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: size.height * 0.02),
        decoration: BoxDecoration(
          color: selectedDate.day == day
              ? CustomColors.blue
              // ? Theme.of(context).primaryColorLight
              : Colors.white,
          // : Theme.of(context).disabledColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              "$day",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    color: selectedDate.day == day
                        ? Colors.white
                        // ? Theme.of(context).primaryColorDark
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              DateTime(selectedDate.year, selectedDate.month, day).weekday ==
                      DateTime.saturday
                  ? "Sat"
                  : DateTime(selectedDate.year, selectedDate.month, day)
                              .weekday ==
                          DateTime.sunday
                      ? "Sun"
                      : DateTime(selectedDate.year, selectedDate.month, day)
                                  .weekday ==
                              DateTime.monday
                          ? "Mon"
                          : DateTime(selectedDate.year, selectedDate.month, day)
                                      .weekday ==
                                  DateTime.tuesday
                              ? "Tue"
                              : DateTime(selectedDate.year, selectedDate.month,
                                              day)
                                          .weekday ==
                                      DateTime.wednesday
                                  ? "Wed"
                                  : DateTime(selectedDate.year,
                                                  selectedDate.month, day)
                                              .weekday ==
                                          DateTime.thursday
                                      ? "Thu"
                                      : DateTime(selectedDate.year,
                                                      selectedDate.month, day)
                                                  .weekday ==
                                              DateTime.friday
                                          ? "Fri"
                                          : "",
              style: TextStyle(
                fontSize: 10,
                color: selectedDate.day == day
                    ? Colors.white
                    // ? Theme.of(context).primaryColorDark
                    : Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w400,
              ),
            ),
            // CircleAvatar(
            //   radius: 15,
            //   backgroundColor: Theme.of(context).primaryColorDark,
            //   child: FittedBox(
            //     fit: BoxFit.scaleDown,
            //     child:
            //     Text(
            //       "$day",
            //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w600,
            //           ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
