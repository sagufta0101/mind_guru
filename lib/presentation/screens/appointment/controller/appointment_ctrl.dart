import 'package:endurance_app/model/appointment_model.dart';
import 'package:endurance_app/model/booked_dates_model.dart';
import 'package:get/get.dart';
import '../../../../network/appointment_service.dart';

class AppointmentController extends GetxController {
  final AppointmentService _appointmentService = AppointmentService();
  RxBool isLoading = false.obs;
  Rx<DateTime?> availableDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  // DateTime? selectedDate;
  RxList<Appointment> appointmentList = <Appointment>[].obs;
  RxList<BookedDates> bookedDateTimeList = <BookedDates>[].obs;
  RxMap<DateTime, List<Appointment>> groupedAppointments =
      <DateTime, List<Appointment>>{}.obs;
  // RxList<CalenderModel> dateScheduleList = <CalenderModel>[].obs;
  // Rx<PrescriptionAnalytics?> analytics = PrescriptionAnalytics().obs;

  Future<bool> createAppointment(String time, String note) async {
    isLoading(true);
    final result = await _appointmentService.createAppointment(time, note);
    if (result) {
      await getAppointmentData();
      await getBookedDateTime();
    }
    isLoading(false);
    return result;
  }

  getAppointmentData() async {
    isLoading(true);

    final result = await _appointmentService.getAppointmentList();
    if (result.isNotEmpty) {
      appointmentList.value = result;
      // Sort appointments by date
      List<Appointment> appointments = appointmentList.value;
      appointments
          .sort((a, b) => a.appointmentTime.compareTo(b.appointmentTime));

      // Group appointments by date
      // Map<DateTime, List<Appointment>> groupedAppointments = {};
      appointments.forEach((appointment) {
        DateTime date = appointment.appointmentTime.toLocal().date;
        groupedAppointments.value[date] ??= [];
        groupedAppointments.value[date]?.add(appointment);
      });
      // Render grouped appointments
      groupedAppointments.value.forEach((date, appointments) {
        print('Date: $date');
        appointments.forEach((appointment) {
          print(
              'Appointment: ${appointment.id}, Time: ${appointment.appointmentTime}');
        });
      });
    }
    isLoading(false);
  }

  getBookedDateTime() async {
    isLoading(true);

    final result = await _appointmentService.getBookedDates();
    if (result.isNotEmpty) {
      bookedDateTimeList.value = result;
    }
    isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    getAppointmentData();
    getBookedDateTime();
    availableDate.value = await _appointmentService.getStartAvailableDate();
    selectedDate.value = availableDate.value;
    super.onInit();
  }
  // @override
  // void onInit() async {
  //   // TODO: implement onInit

  //   await Permission.ignoreBatteryOptimizations.request();

  //   await Permission.notification.request();

  //   await getHomeAnalytics();
  //   await initializeNotifications(flutterLocalNotificationsPlugin);
  //   registerWorkManageer();
  //   await scheduleNotification(
  //       scheduledNotificationDateTime: DateTime(2024, 3, 4, 22, 50),
  //       body: 'Sleep its Bed time',
  //       id: 2,
  //       payLoad: 'sleepTime',
  //       title: 'Time for bed');
  //   // showMoodTrackingDialog();
  //   super.onInit();
  // }
}
