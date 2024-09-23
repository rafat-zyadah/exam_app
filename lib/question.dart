class Question {
  late String questionText;
  late String questionImage;
  late bool questionAnswer;
  Question({String? q, String? i, bool? a}) {
    questionText = q!;
    questionAnswer = a!;
    questionImage = i!;
  }
}
