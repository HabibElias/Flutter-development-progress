shuffle(List<String> list) => list.shuffle();

class Questions {
    final int responseCode;
    final List<Question> results;

    Questions({
        required this.responseCode,
        required this.results,
    });

    factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        responseCode: json["response_code"],
        results: List<Question>.from(json["results"].map((x) => Question.fromJson(x))),
    );
}

class Question {
  final String aQuestion;
  final String answer;
  final List<String> answers;
  String selectedoption;
  bool answered;

  Question({
    required this.aQuestion,
    required this.answered,
    required this.answers,
    required this.answer,
    required this.selectedoption,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      aQuestion: json["question"],
      answer: json["correct_answer"],
      answers: 
        List<String>.from(json["incorrect_answers"].map((x) => x)),
      selectedoption: '',
      answered: false,
    );
  }
}
