import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.homeScreen, required this.answers});

  void Function() homeScreen;
  List<String> answers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < answers.length; i++) {
      summary.add(
        {
          'que_ind': i,
          'question': questions[i].text,
          'correct': questions[i].answers[0],
          'user_ans': answers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    int correctAnswerCount = summaryData.where(
      (data) {
        return data['correct'] == data['user_ans'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctAnswerCount out of ${questions.length} questions correctly",
              style: const TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: homeScreen,
              child: const Text("Restart quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
