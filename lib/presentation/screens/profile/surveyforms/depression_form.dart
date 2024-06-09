import 'dart:developer';

import 'package:endurance_app/presentation/screens/profile/surveyforms/anxiety_form_landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/text_style.dart';
import 'easy_depression_result.dart';
import 'resultPage.dart';

class DepressionForm extends StatefulWidget {
  // bool isFirst = false;
  DepressionForm({
    required this.questions,
    required this.formType,
    //  required this.isFirst
  });
  List<Map<String, dynamic>> questions;
  String formType;
  @override
  _DepressionFormState createState() => _DepressionFormState();
}

class _DepressionFormState extends State<DepressionForm> {
  PageController _pageController = PageController();
  // Map<int, int?> answers = {};
  Map<int, List<double>> answers =
      {}; // Changed answers to handle multiple selected values

  int _currentStep = 0;
  void _onSubmit() {
    double totalScore = 0;
    for (var entry in answers.entries) {
      var key = entry.key;
      List<double> selectedValues = entry.value;
      log('Key: $key');
      log('Value: $selectedValues');
      log(widget.questions[key.toInt()]['isoptional'].toString());
      if (widget.questions[key.toInt()]['isoptional'] == false ||
          widget.questions[key.toInt()]['isoptional'] == null) {
        log("loop k ander $key");
        totalScore += selectedValues.isNotEmpty
            ? selectedValues.reduce((a, b) => a + b)
            : 0;
      }
      // Here, you can access key and value individually
    }
    // answers.values.forEach((selectedValues) {
    //   totalScore += selectedValues.isNotEmpty
    //       ? selectedValues.reduce((a, b) => a + b)
    //       : 0;
    // });
    // int totalScore =
    //     answers.values.fold(0, (sum, answer) => sum + (answer ?? 0));
    print("Total score: $totalScore");
    if (widget.formType == 'severity_depression') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionResultScreen(
              totalScore: totalScore,
              formType: widget.formType,
              onpressed: () {
                // if (widget.isFirst) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => AnxietyFormLanding(),
                //       ));
                // } else {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                // }
              },
            ),
          ));
    } else if (widget.formType == 'easy_depression') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              totalScore: totalScore,
              formType: widget.formType,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'alcohol') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              totalScore: totalScore,
              formType: widget.formType,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'bipolar') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              totalScore: totalScore,
              formType: widget.formType,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'anxiety') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DepressionResultScreen(
              formType: widget.formType,
              totalScore: totalScore,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'psychosis') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              formType: widget.formType,
              totalScore: totalScore,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'adult_adhd') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              formType: widget.formType,
              totalScore: totalScore,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'children_behaviour') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              formType: widget.formType,
              totalScore: totalScore,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    } else if (widget.formType == 'post_partum') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EasyDepressionResultScreen(
              formType: widget.formType,
              totalScore: totalScore,
              onpressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ));
    }
    // You can handle the result further, such as displaying it in a dialog or navigating to a result page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Self Assessment',
          style: AvenirTextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CustomColors.blue,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentStep + 1) / (widget.questions.length + 1),
            backgroundColor: Colors.grey,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.questions.length
              // +
              //     1
              , // Additional page for reflection question
              itemBuilder: (context, index) {
                // if (index == widget.questions.length) {
                //   // Reflection question page
                //   return DepressionReflectionQuestion(
                //     questionNumber: 20,
                //     selectedValue: answers[20],
                //     onChanged: (int answer) {
                //       setState(() {
                //         answers[20] = answer;
                //         if (index < widget.questions.length) {
                //           _pageController.nextPage(
                //               duration: Duration(milliseconds: 500),
                //               curve: Curves.ease);
                //         }
                //       });
                //     },
                //   );
                // } else {
                //   // Question pages
                bool isLastPage = index == widget.questions.length - 1;
                return
                    // isLastPage
                    //     ?
                    SingleChildScrollView(
                  child: Column(
                    children: [
                      DepressionQuestion(
                        questionData: widget.questions[index],
                        // selectedValue: answers[index + 11],
                        selectedValues: answers[index] ?? [],
                        // onChanged: (int answer) {
                        //   setState(() {
                        //     answers[index + 11] = answer;
                        //     _currentStep = index + 1;
                        //   });
                        // },
                        onChanged: (List<double> selectedValues) {
                          setState(() {
                            if (widget.formType == 'bipolar') {
                              String ques = widget.questions[index]['question'];

                              bool isFirstQues =
                                  ques.split(' ').first.split('').first == '1';
                              bool isSecondQues =
                                  ques.split(' ').first.split('').first == '2';
                              log("ques==============${ques.split(' ').first.split('').first}");
                              bool isThirdQues =
                                  ques.split(' ').first.split('').first == '3';
                              if (isFirstQues) {
                                if (selectedValues.first.round() == 1) {
                                  log("first selectedValues-----$selectedValues");
                                  answers[index] = [1 / 11];
                                  log(answers.toString());
                                } else {
                                  answers[index] = [0];
                                }
                              }
                              if (isSecondQues) {
                                log("${isSecondQues}--------${selectedValues.first.round()}");
                                answers[index] = selectedValues;
                              }
                              log("isThirdQues-----$isThirdQues");
                              if (isThirdQues) {
                                log(selectedValues.first.round().toString());
                                if ((selectedValues.first.round() == 2 ||
                                    selectedValues.first.round() == 3)) {
                                  answers[index] = [0];
                                } else {
                                  answers[index] = [1];
                                }
                              }
                            } else {
                              answers[index] = selectedValues;
                              log("selected values-------$selectedValues");
                              log("amswers-------$answers");
                            }
                            if (!isLastPage) {
                              if (widget.questions[index]['type'] !=
                                  'multiple') {
                                log("message");
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            } else {
                              if (widget.questions[index]['type'] != 'multiple')
                                _onSubmit();
                            }
                            _currentStep = index + 1;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: _onSubmit,
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                );
                // : DepressionQuestion(
                //     questionData: widget.questions[index],
                //     selectedValue: answers[index + 11],
                //     onChanged: (int answer) {
                //       setState(() {
                //         answers[index + 11] = answer;
                //         if (index < widget.questions.length - 1) {
                //           _pageController.nextPage(
                //               duration: Duration(milliseconds: 500),
                //               curve: Curves.ease);
                //         }
                //         _currentStep = index + 1;
                //       });
                //     },
                //   );
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DepressionQuestion extends StatelessWidget {
  final Map<String, dynamic> questionData;
  final List<double>? selectedValues;
  final ValueChanged<List<double>> onChanged;

  DepressionQuestion({
    required this.questionData,
    required this.selectedValues,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMultipleChoice = questionData['type'] == 'multiple';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${questionData['question']}',
            style: TextStyle(fontSize: 16),
          ),
          for (int i = 0; i < questionData['options'].length; i++)
            isMultipleChoice
                ? CheckboxListTile(
                    title: Text(questionData['options'][i]),
                    value: selectedValues!.contains(i),
                    onChanged: (bool? value) {
                      if (value != null) {
                        final List<double> newSelectedValues =
                            List.from(selectedValues!);
                        if (value) {
                          newSelectedValues.add(i.toDouble());
                        } else {
                          newSelectedValues.remove(i.toDouble());
                        }
                        onChanged(newSelectedValues);
                      }
                    },
                  )
                : RadioListTile<int>(
                    title: Text(questionData['options'][i]),
                    value: i,
                    groupValue: selectedValues!.isEmpty
                        ? null
                        : selectedValues![0].toInt(),
                    onChanged: (int? value) {
                      if (value != null) {
                        onChanged([value.toDouble()]);
                      }
                    },
                  ),
        ],
      ),
    );
  }
}

// class DepressionQuestion extends StatelessWidget {
//   final Map<String, dynamic> questionData;
//   final int? selectedValue;
//   final ValueChanged<int> onChanged;

//   DepressionQuestion(
//       {required this.questionData,
//       required this.selectedValue,
//       required this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '${questionData['question']}',
//             style: TextStyle(fontSize: 16),
//           ),
//           for (int i = 0; i < questionData['options'].length; i++)
//             RadioListTile<int>(
//               title: Text(questionData['options'][i]),
//               value: i,
//               groupValue: selectedValue,
//               onChanged: (int? value) {
//                 onChanged(value!);
//               },
//             ),
//         ],
//       ),
//     );
//   }
// }

class DepressionReflectionQuestion extends StatelessWidget {
  final int questionNumber;
  final int? selectedValue;
  final ValueChanged<int> onChanged;

  DepressionReflectionQuestion(
      {required this.questionNumber,
      required this.selectedValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$questionNumber. Reflection question text goes here:',
            style: TextStyle(fontSize: 16),
          ),
          for (int i = 0; i < 4; i++)
            RadioListTile<int>(
              title: Text("Option ${i + 1}"),
              value: i + 1,
              groupValue: selectedValue,
              onChanged: (int? value) {
                onChanged(value!);
              },
            ),
        ],
      ),
    );
  }
}
