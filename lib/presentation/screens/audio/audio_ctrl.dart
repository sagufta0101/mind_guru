import 'package:endurance_app/main.dart';
import 'package:endurance_app/model/audio_model.dart';
import 'package:endurance_app/model/calender_model.dart';
import 'package:endurance_app/model/prescription_analytics_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../model/daily_activity_model.dart';
import '../../../network/calender_tab_service.dart';

class AudioTabController extends GetxController {
  final HomeTabService _homeService = HomeTabService();
  RxBool isLoading = false.obs;
  // RxList<CalenderModel> scheduleList = <CalenderModel>[].obs;
  RxList<AudioModel> audioList = <AudioModel>[].obs;

  getAudioList() async {
    isLoading(true);
    final result = await _homeService.getAudioApi();
    // if (result != null) {
    audioList.value = result;
    // }
    isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getAudioList();
    super.onInit();
  }
}
