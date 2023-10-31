import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int curQIndex = 0;
  selectAnswer() {
    setState(() {
      curQIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final curQ = questions[curQIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curQ.text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            ...curQ.getShuffledAnswers().map(
              (element) {
                return AnswerButton(selectAnswer, element);
              },
            ),
          ],
        ),
      ),
    );
  }
}
