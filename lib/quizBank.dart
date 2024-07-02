import 'package:quizzy/questions.dart';

class Quizbank {
  int _questionnumber = 0;
  List<Questions> _questionBank = [
    Questions(q: 'Sharks are mammals.', a: false),
    Questions(
        q: 'Sea otters have a favorite rock they use to break open food.',
        a: true),
    Questions(
        q: 'The blue whale is the biggest animal to have ever lived.', a: true),
    Questions(
        q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true),
    Questions(
        q: 'Pigs roll in the mud because they don\'t like being clean.',
        a: false),
    Questions(q: 'Sharks are mammals.', a: false),
    Questions(
        q: 'Sea otters have a favorite rock they use to break open food.',
        a: true),
    Questions(
        q: 'The blue whale is the biggest animal to have ever lived.', a: true),

 
  ];

  void nextQuestion() {
    if (_questionnumber < _questionBank.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestiontext() {
    return _questionBank[_questionnumber].qusetionText;
  }

  bool getQuestionanswer() {
    return _questionBank[_questionnumber].questionAnswer;
  }

  bool isfinished() {
    if (_questionnumber == _questionBank.length-1)
      return true;
    else
      return false;
  }

  void reset() {
    _questionnumber = 0;
  }
}
