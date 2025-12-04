import 'package:flutter/material.dart';
import 'ui/screens/welcome_screen.dart';
import 'ui/screens/question_screen.dart';
import 'data/repositories/quiz_mock_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => WelcomeScreen(

          onStart: () {
            final questions = QuizMockRepository().getQuestions();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionScreen(questions: questions),
              ),
            );
          },
        ),
      ),
    );
  }
}
