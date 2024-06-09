import 'package:endurance_app/main.dart';
import 'package:endurance_app/model/audio_model.dart';
import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/model/prescription_analytics_model.dart';
import 'package:endurance_app/model/profile_model.dart';
import 'package:endurance_app/network/calender_tab_service.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController {
  final HomeTabService _homeService = HomeTabService();
  RxBool isLoading = false.obs;
  // RxList<CalenderModel> scheduleList = <CalenderModel>[].obs;
  RxList<PatientProfile> profileData = <PatientProfile>[].obs;

  getProfileInfo() async {
    isLoading(true);
    final result = await _homeService.getProfileData();
    // if (result != null) {
    profileData.value = result;
    // }
    isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getProfileInfo();
    super.onInit();
  }
}
