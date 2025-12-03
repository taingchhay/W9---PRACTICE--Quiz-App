import '../../model/quiz.dart';

class QuizMockRepository {
  List<Question> getQuestions() {
    return [
      Question(
        title: 'Who is the best Teacher?',
        multipleChoice: ['Ronan', 'Hongly', 'Leangsiv'],
        correctAnswer: 'Ronan',
      ),

      Question(
        title: 'Which planet is known as the Red Planet?',
        multipleChoice: ['Venus', 'Mars', 'Jupiter'],
        correctAnswer: 'Mars',
      ),

      Question(
        title: 'What is 2 + 2?',
        multipleChoice: ['3', '4', '5'],
        correctAnswer: '4',
      ),

      Question(
        title: 'Who painted the Mona Lisa?',
        multipleChoice: ['Picasso', 'Da Vinci', 'Michelangelo'],
        correctAnswer: 'Da Vinci',
      ),

      // Question(
      //   title: 'What is the largest ocean on Earth?',
      //   multipleChoice: ['Indian', 'Arctic', 'Pacific'],
      //   correctAnswer: 'Pacific',
      // ),
    ];
  }
}
