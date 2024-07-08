import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  Color getQuestionIndexBgColor(isAnsweCorrect) {
    if (isAnsweCorrect) {
      return const Color.fromARGB(255, 107, 197, 245);
    } else {
      return const Color.fromARGB(255, 245, 107, 153);
    }
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: getQuestionIndexBgColor(
                        (data['user_answer'] as String) ==
                            (data['correct_answer'] as String)),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 33, 1, 95),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text((data['question'] as String)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text((data['user_answer'] as String)),
                      Text((data['correct_answer'] as String)),
                    ],
                  ),
                )
              ],
            );
            // return Text(((data['question_index'] as int) + 1).toString());
          }).toList(),
        ),
      ),
    );
  }
}
