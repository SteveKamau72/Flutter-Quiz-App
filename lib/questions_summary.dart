import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        (data['question'] as String),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (data['user_answer'] as String),
                        style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 220, 107, 245)),
                      ),
                      Text(
                        (data['correct_answer'] as String),
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 107, 197, 245)),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
