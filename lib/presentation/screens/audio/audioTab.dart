import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:endurance_app/constant/app_constant.dart';
import 'package:endurance_app/presentation/screens/audio/audio_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/custom_input.dart';
import '../../../theme/colors.dart';

class InputFieldWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none, // Remove the default border
          contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none, // No border when focused
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none, // No border when enabled
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class AudioTab extends StatefulWidget {
  AudioTab({super.key});

  @override
  State<AudioTab> createState() => _AudioTabState();
}

class _AudioTabState extends State<AudioTab> {
  final AudioPlayer audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  int? playingIndex; // The index of the currently playing audio, if any
  final audioCtrl = Get.put(AudioTabController());
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  bool isLoading = false;
  // void playAudio(String url) async {
  //   if (isPlaying) {
  //     await audioPlayer.pause();
  //   } else {
  //     await audioPlayer.play(UrlSource(url));
  //   }
  // }
  Future<void> playAudio(String url, int index) async {
    log(url);
    isLoading = true;
    setState(() {});
    // await audioPlayer.play(UrlSource(url));
    // return;
    try {
      if (playingIndex == index) {
        if (audioPlayer.state == PlayerState.playing) {
          await audioPlayer.pause();
        } else {
          await audioPlayer.resume();
          await audioPlayer.play(UrlSource(url));
        }
      } else {
        await audioPlayer.stop();
        await audioPlayer.play(UrlSource(url));
        playingIndex = index;
      }
    } catch (e) {
      print("Error playing audio: $e");
      // Handle the error here, e.g., display an error message to the user
    }
    isLoading = false;
    setState(() {});
  }

  void seekAudio(Duration duration) {
    audioPlayer.seek(duration);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sounds',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CustomColors.blue,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 20,
              // ),

              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
              //   child: InputFieldWithIcon(),
              // ),
              Container(
                width: size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Text(
                        'Audio',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Obx(() {
                      return ListView.builder(
                        itemCount: audioCtrl.audioList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
                          elevation: 1,
                          // margin: EdgeInsets.symmetric(vertical: 6),
                          shadowColor: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://i.ytimg.com/vi/EnrNtaMskik/maxresdefault.jpg',
                                      width: size.width * 0.2,
                                      height: size.height * 0.1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // contentPadding: EdgeInsets.symmetric(horizontal: 2),
                                  title: Text(
                                    audioCtrl.audioList[index].audioName ??
                                        'Title of Audio',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    'For Meditation, Relaxation',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await playAudio(
                                            // 'http://doctor.emcindore.in/media/sounds/Chaleya_-_Jawan_128_Kbps.mp3',
                                            ApiConstant.rootUrl +
                                                    audioCtrl.audioList[index]
                                                        .audioFile ??
                                                'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3',
                                            index);
                                      },
                                      // playAudio('assets/images/audio.mp3'),
                                      icon: Icon(
                                        isLoading
                                            ? Icons.timer_3_rounded
                                            : playingIndex == index &&
                                                    audioPlayer.state ==
                                                        PlayerState.playing
                                                ? Icons.pause
                                                : Icons.play_circle_outline,
                                        color: CustomColors.elevatedButtonColor,
                                      )),
                                ),
                                if (playingIndex ==
                                    index) // Show the slider only for the playing audio
                                  Column(
                                    children: [
                                      Slider(
                                        min: 0,
                                        max: duration.inSeconds.toDouble(),
                                        value: position.inSeconds.toDouble(),
                                        onChanged: (value) {
                                          seekAudio(
                                              Duration(seconds: value.toInt()));
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(formatTime(position)),
                                            Text(formatTime(
                                                duration - position)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
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
