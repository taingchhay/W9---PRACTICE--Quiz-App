import 'package:flutter/material.dart';
import '../../model/quiz.dart';

class ResultScreen extends StatelessWidget {
  final List<String> userAnswers;
  final List<Question> questions;

  const ResultScreen({
    super.key,
    required this.userAnswers,
    required this.questions,
  });

  // calcu score 
  int get score {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        correct++;
      }
    }
    return correct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      body: SafeArea(

        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Text(
                'You answered $score on ${questions.length} !',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final userAnswer = userAnswers[index];
                    final isCorrect = userAnswer == question.correctAnswer;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  question.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),

                                ...question.multipleChoice.map((choice) {
                                  final isCorrectAnswer =
                                      choice == question.correctAnswer;
                                  final isUserWrongAnswer =
                                      choice == userAnswer && !isCorrect;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      bottom: 2,
                                    ),
                                    child: Row(
                                      children: [
                                        if (isCorrectAnswer)
                                          const Text(
                                            '✓ ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        else
                                          const Text('   '),
                                        Text(
                                          choice,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: isUserWrongAnswer
                                                ? Colors.red
                                                : Colors.white,
                                            fontWeight: isCorrectAnswer
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontStyle: isCorrectAnswer
                                                ? FontStyle.italic
                                                : FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
