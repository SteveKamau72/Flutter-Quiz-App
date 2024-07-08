import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/results_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

enum Screens { startScreen, questionsScreen, resultScreen }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = Screens.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = Screens.questionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Screens.resultScreen;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Screens.startScreen;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == Screens.startScreen) {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == Screens.questionsScreen) {
      screenWidget = QuestionsScreen(chooseAnswer);
    } else {
      screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswers, onRestartQuiz: restartQuiz);
    }

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
