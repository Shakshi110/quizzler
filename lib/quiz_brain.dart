import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  int _totalCorrectAnswer = 0;

  int get totalCorrectAnswer => _totalCorrectAnswer;

  final List<Question> _questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    Question(
        questionText: 'The hummingbird egg is the world\'s smallest bird egg.',
        questionAnswer: true),
    Question(
        questionText: 'Mount Everest is the tallest mountain in the world.',
        questionAnswer: true),
    Question(
        questionText: 'Human skin regenerates every week.',
        questionAnswer: false),
    Question(
        questionText: 'The most common blood type is 0- negative.',
        questionAnswer: true),
    Question(
        questionText:
            'Pigs roll in the mud because they don\'t like being clean.',
        questionAnswer: false),
    Question(questionText: 'Bats are blind.', questionAnswer: false),
    Question(questionText: 'Pineapples grow on trees.', questionAnswer: false),
    Question(
        questionText: 'An astronaut has played golf on the moon.',
        questionAnswer: true),
    Question(
        questionText: 'Every country in the world has a rectangular flag.',
        questionAnswer: false),
    Question(
        questionText: 'It takes a sloth two weeks to digest a meal.',
        questionAnswer: true),
    Question(
        questionText: 'An ant can lift 1,000 times its body weight.',
        questionAnswer: false),
    Question(
        questionText: 'The human body has four lungs.', questionAnswer: false),
    Question(
        questionText: 'Infants have more bones than adults.',
        questionAnswer: true),
    Question(
        questionText:
            'The human eye can distinguish 10 million different colors.',
        questionAnswer: true),
    Question(
        questionText: 'An octopus has seven hearts.', questionAnswer: false),
    Question(
        questionText: 'Greenland is the largest island in the world.',
        questionAnswer: true),
    Question(
        questionText:
            'Polo takes up the largest amount of space in terms of land area.',
        questionAnswer: true),
    Question(
        questionText:
            'The blue whale is the biggest animal to have ever lived.',
        questionAnswer: true)
  ];

  // void nextQuestion(){
  //   if (_questionNumber<_questionBank.length){
  //     _questionNumber++;
  //   }
  // }

  void nextquestion() {
    if (_questionNumber <= _questionBank.length ) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  increaseTotalCorrectCount(){
    _totalCorrectAnswer = _totalCorrectAnswer+1;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length-1) {
      print('now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  void result() {
    _totalCorrectAnswer = 0;
  }
// void increaseScore(){
//  if()
// }
}
