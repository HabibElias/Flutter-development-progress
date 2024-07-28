class Question {
  final String aquestion;
  final String answer;
  String selectedoption;
  final List<String> answers;
  bool answered;

  Question({
    required this.aquestion,
    required this.selectedoption,
    required this.answer,
    required this.answered,
    required this.answers,
  });
}
