import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
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

  var activeScreen = 'strat-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'qusetion-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "qusetion-screen") {
      screenWidget = const QusestionScreen();
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
