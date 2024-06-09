import 'package:endurance_app/shared/widgets/custom_button.dart';
import 'package:endurance_app/shared/widgets/inputField.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MoodController extends GetxController {
  var selectedMood = RxString('');
  var moods = ['😊', '😐', '🙁'];

  void selectMood(String mood) {
    selectedMood.value = mood;
    Get.back();
    // Show thanks for the feedback
    Get.snackbar('Thanks!', 'Thanks for your feedback! 😊');
  }
}

addMoodTrackingDialog(
    String time,
    String secondTime,
    BuildContext context,
    double moodRating,
    TextEditingController note,
    void Function(double) onRatingUpdated,
    void Function() onPressed) {
  Get.dialog(
    AlertDialog(
      title: Text('Make your entry for $time - $secondTime'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Rate Your mood '),
            RatingBar.builder(
              initialRating: moodRating,
              itemCount: 10, // Total marks is now 10
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_neutral_outlined,
                      color: Colors.amber,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 5:
                    return Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Colors.lightGreen,
                    );
                  case 6:
                    return Icon(
                      Icons.sentiment_satisfied_alt,
                      color: Colors.lightGreen,
                    );
                  case 7:
                    return Icon(
                      Icons.sentiment_very_satisfied_outlined,
                      color: Colors.green,
                    );
                  case 8:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  case 9:
                    return Icon(
                      Icons.sentiment_very_satisfied_rounded,
                      color: Colors.green,
                    );
                  default:
                    return Container(); // Default case returns an empty Container
                }
              },
              onRatingUpdate: (rating) {
                onRatingUpdated(rating);
                print(
                    rating); // This will print the selected rating (out of 10)
              },
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              maxLine: 5,
              // controller: noteController,
              hint: 'Activities (write comma separated)', minLine: 5,
              controller: note,
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
                  onPressed();
                  Get.back();
                },
                style: Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    ),
  );
}
// showMoodTrackingDialog() {
//   final MoodController moodController = Get.put(MoodController());
//   Get.dialog(
//     AlertDialog(
//       title: Text('How\'s your mood today?'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           for (var mood in moodController.moods)
//             ListTile(
//               title: Text(
//                 mood,
//                 style: TextStyle(fontSize: 40),
//               ),
//               onTap: () => moodController.selectMood(mood),
//             ),
//         ],
//       ),
//     ),
//   );
// }
