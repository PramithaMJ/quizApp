import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QusestionScreen();
  //   });
  // }

  List<String> _selectedAnswer = [];

  var activeScreen = 'strat-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'qusetion-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);
    if (_selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QusestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "qusetion-screen") {
      screenWidget = QusestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: _selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 109, 52, 173),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          child: screenWidget,
        ),
      ),
    );
  }
}
