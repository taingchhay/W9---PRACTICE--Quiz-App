import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> multipleChoice;
  final String correctAnswer;

  Question({
    String? id,
    required this.title,
    required this.multipleChoice,
    required this.correctAnswer,
  }) : id = id ?? uuid.v4();
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id, 
    required this.questionId,
    required this.answerChoice
    }) : id = id ?? uuid.v4();
}

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({
    List<Question>? questions,
    List<Answer>? answers
    }): questions = questions ?? [], 
      answers = answers ?? [];
}
