import 'package:flutter/material.dart';

class DepressionForm extends StatefulWidget {
  @override
  _DepressionFormState createState() => _DepressionFormState();
}

class _DepressionFormState extends State<DepressionForm> {
  Map<int, int> answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int questionNumber = 11;
                  questionNumber <= 19;
                  questionNumber++)
                DepressionQuestion(
                  questionNumber: questionNumber,
                  onChanged: (int answer) {
                    setState(() {
                      answers[questionNumber] = answer;
                    });
                  },
                ),
              SizedBox(height: 16),
              DepressionReflectionQuestion(
                questionNumber: 20,
                onChanged: (int answer) {
                  setState(() {
                    answers[20] = answer;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  int totalScore = answers.values.fold(0, (a, b) => a + b);
                  print("Total Score: $totalScore");

                  // Add your logic here to interpret the total score and determine depression level
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DepressionQuestion extends StatelessWidget {
  final int questionNumber;
  final ValueChanged<int> onChanged;

  DepressionQuestion({required this.questionNumber, required this.onChanged});
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$questionNumber. Question text goes here:',
          style: TextStyle(fontSize: 16),
        ),
        for (int i = 0; i < 4; i++)
          RadioListTile<int>(
            title: Text(_getAnswerText(i)),
            value: i + 1,
            groupValue: selectedValue,
            onChanged: (int? value) {
              onChanged(value!);
            },
          ),
      ],
    );
  }

  String _getAnswerText(int answerIndex) {
    // You can customize the answer text based on the question and answer index
    // For example: return "Answer ${answerIndex + 1}";
    return "Option ${answerIndex + 1}";
  }
}

class DepressionReflectionQuestion extends StatefulWidget {
  final int questionNumber;
  final ValueChanged<int> onChanged;

  DepressionReflectionQuestion(
      {required this.questionNumber, required this.onChanged});

  @override
  State<DepressionReflectionQuestion> createState() =>
      _DepressionReflectionQuestionState();
}

class _DepressionReflectionQuestionState
    extends State<DepressionReflectionQuestion> {
  int? selectedValue;
  // Add this line
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.questionNumber}. Question text goes here:',
          style: TextStyle(fontSize: 16),
        ),
        for (int i = 0; i < 4; i++)
          RadioListTile<int>(
            title: Text(_getAnswerText(i)),
            value: i + 1,
            groupValue: selectedValue, // Change this line
            onChanged: (int? value) {
              widget.onChanged(value!);
              setState(() {
                selectedValue = value;
              });
            },
          ),
      ],
    );
  }

  String _getAnswerText(int answerIndex) {
    // You can customize the answer text based on the question and answer index
    // For example: return "Answer ${answerIndex + 1}";
    return "Option ${answerIndex + 1}";
  }
}
