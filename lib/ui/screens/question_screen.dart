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
  int _questionState = 0;
  final List<String> _userAnswers = [];

  Question get _currentQuestion => widget.questions[_questionState];
  bool get _isLastQuestion => _questionState == widget.questions.length - 1;

  void _onAnswerTap(String answer) {
    _userAnswers.add(answer);

    Future.delayed(const Duration(milliseconds: 300), () {
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
          _questionState++;
        });
      }
    });
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

              for (var choice in _currentQuestion.multipleChoice)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _onAnswerTap(choice),
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
                ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
