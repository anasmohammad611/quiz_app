import 'package:flutter/material.dart';
import 'package:quiz_app/styling/rounded_number.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedNumberWidget(number: (data['que_ind'] as int) + 1),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text((data['question']).toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text((data['user_ans']).toString(),
                              style: const TextStyle(
                                  color: Colors.yellow, fontSize: 15)),
                          Text((data['correct']).toString(),
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
