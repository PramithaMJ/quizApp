import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> choosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'qusetion': questions[i].text,
          'correct answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = summaryData;
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answer $numCorrectQuestion out of $numTotalQuestions questions correctly!',
              // style: GoogleFonts.lato(
              //   color: const Color.fromARGB(255, 230, 200, 253),
              //   fontSize: 20,
              //   FontWeight: FontWeight.bold,
              // ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}
