import 'package:flutter/material.dart';
import 'package:my_quiz_app/data/questions.dart';
import 'package:my_quiz_app/questions_screen.dart';
import 'package:my_quiz_app/result_screen.dart';
import 'package:my_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (questions.length == selectedAnswers.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers);
        selectedAnswers = [];
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchState);
    super.initState();
  }

  void switchState() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
