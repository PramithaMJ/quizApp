import 'package:flutter/material.dart';
import 'package:quizapp/questions_summary/question_identifier.dart';

class Summaryitem extends StatelessWidget {
  const Summaryitem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectedAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectedAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                // style: GoogleFonts.lato(
                //   color: Colors.white,
                //   fontSize: 16,
                //   FontWeight: FontWeight.bold,
                // ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
