import 'dart:developer';

import 'package:endurance_app/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/appointment_model.dart';
import '../../../theme/colors.dart';
import 'controller/appointment_ctrl.dart';

class ListAppointment extends StatelessWidget {
  ListAppointment({super.key});
  final appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Appointments'),
        titleTextStyle: AvenirTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: CustomColors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
            // width: size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                itemCount: appointmentController.groupedAppointments.length,
                itemBuilder: (context, index) {
                  DateTime date = appointmentController.groupedAppointments.keys
                      .elementAt(index);
                  List<Appointment> appointments =
                      appointmentController.groupedAppointments[date]!;
                  log(appointmentController.groupedAppointments.toString());
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text('${'${DateFormat('yyyy-MM-dd').format(date)}'}'),
                        Column(
                          children: appointments
                              .map((appointment) => Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Card(
                                      elevation: 6,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 45,
                                            color: CustomColors
                                                .elevatedButtonColor,
                                            child: Center(
                                              child: Text(
                                                  '${'${DateFormat('yyyy-MM-dd').format(date)}'}'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      radius: 30,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/doctor.jpg')),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        appointment.doctor
                                                                .firstName ??
                                                            'Dr. Ashwin',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall
                                                            ?.copyWith(
                                                                letterSpacing:
                                                                    1),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .timer_sharp),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "${appointment.appointmentTime.toLocal().hour} : ${appointment.appointmentTime.toLocal().minute}",
                                                                // . 'Dentist',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .local_hospital_outlined),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                  appointment
                                                                          .doctor
                                                                          .clinicAddress ??
                                                                      'Cleveland Clinic',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
