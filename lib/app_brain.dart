import 'question.dart';

class AppBrain {
  int _questionNumber = 0;
  final List<Question> _questionGroub = [
    Question(
      q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(
      q: 'القطط هي حيوانات لاحمة',
      i: 'images/image-2.jpg',
      a: true,
    ),
    Question(
      q: "الصين موجودة في القارة الإفريقية",
      i: 'images/image-3.jpg',
      a: false,
    ),
    Question(
      q: "الأرض مسطحة وليست كروية",
      i: 'images/image-4.jpg',
      a: false,
    ),
    Question(
      q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
      i: 'images/image-5.jpg',
      a: true,
    ),
    Question(
      q: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
      i: 'images/image-6.jpg',
      a: false,
    ),
    Question(
      q: "الحيوانات لا تشعر بالألم",
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];
  int numberCorrectAnswer = 0;

  void nextQuestion() {
    if (_questionNumber < _questionGroub.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroub[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroub[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroub[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return (_questionNumber >= 6);
  }

  void reset() {
    numberCorrectAnswer = 0;
    _questionNumber = 0;
  }
}
