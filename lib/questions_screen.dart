import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

import 'styling/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int curQIndex = 0;
  selectAnswer(String ele) {
    widget.onSelectAnswer(ele);
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
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            ...curQ.getShuffledAnswers().map(
              (element) {
                return AnswerButton(
                  txt: element,
                  onTap: () {
                    selectAnswer(element);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
