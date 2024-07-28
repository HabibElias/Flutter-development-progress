import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> questions = [
    Question(
      aquestion: 'What is the capital of France?',
      selectedoption: '',
      answer: 'Paris',
      answered: false,
      answers: [
        'Berlin',
        'London',
        'Paris',
        'Madrid'
      ], // Use 'options' for clarity
    ),
    Question(
      aquestion: 'Which is the tallest mountain in the world?',
      selectedoption: '',
      answer: 'Mount Everest',
      answered: false,
      answers: ['K2', 'Kangchenjunga', 'Lhotse', 'Mount Everest'],
    ),
    Question(
      aquestion: 'What is the largest river in the world by volume?',
      selectedoption: '',
      answer: 'Amazon River',
      answered: false,
      answers: [
        'Nile River',
        'Yangtze River',
        'Mississippi River',
        'Amazon River'
      ],
    ),
    Question(
      aquestion: 'In which year did the first successful flight take place?',
      selectedoption: '',
      answer: '1903',
      answered: false,
      answers: ['1899', '1903', '1907', '1912'],
    ),
  ];

  // a method to get the questions
  List<Question> get getQuestions => questions;

  initState(List<Question> questions) {
    for (var question in questions) {
      question.selectedoption = '';
    }
  }

  // a method to get the answers
  List<String> getAnswers(index) => questions[index].answers;

  // calculate the percentage for your answers

  changeAnswer(int index) {
    if (questions[index].answer == questions[index].selectedoption) {
      questions[index].answered = true;
      notifyListeners();
    } else {
      questions[index].answered = false;
      notifyListeners();
    }
  }
}
