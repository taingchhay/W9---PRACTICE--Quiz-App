import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;

  const QuestionScreen({super.key, required this.questions});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  final List<String> _userAnswers = [];

  Question get _currentQuestion => widget.questions[_currentQuestionIndex];
  bool get _isLastQuestion => _currentQuestionIndex == widget.questions.length - 1;

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  // next/finish button
  void _nextQuestion() {
    if (_selectedAnswer == null) return;

    _userAnswers.add(_selectedAnswer!);

    if (_isLastQuestion) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userAnswers: _userAnswers,
            questions: widget.questions,
          ),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Spacer(),

              Text(
                _currentQuestion.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              ...List.generate(_currentQuestion.multipleChoice.length, (index) {
                final choice = _currentQuestion.multipleChoice[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _selectAnswer(choice);
                        // auto to next question after selection
                        Future.delayed(const Duration(milliseconds: 300), () {
                          _nextQuestion();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(choice, style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                );
              }),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
