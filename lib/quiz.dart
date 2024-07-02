import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

enum Screens { startScreen, questionsScreen }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = Screens.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = Screens.questionsScreen;
    });
  }

  @override
  Widget build(context) {
    final screenWidget = activeScreen == Screens.startScreen
        ? StartScreen(switchScreen)
        : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 70, 10, 81),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
