import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';

class QusestionScreen extends StatefulWidget {
  const QusestionScreen({super.key});

  @override
  State<QusestionScreen> createState() => _QusestionScreenState();
}

class _QusestionScreenState extends State<QusestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.answers.map(
            (answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
