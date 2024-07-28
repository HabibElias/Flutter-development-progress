import 'package:flutter/material.dart';
import 'package:quizproject/models/question_model.dart';

// ignore: must_be_immutable
class QuetionViewer extends StatelessWidget {
  String selectedoption;
  final Question question;
  Function(String?)? onChanged;

  QuetionViewer({
    required this.onChanged,
    required this.question,
    required this.selectedoption,
    super.key,
  });

  // selected option
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
          itemCount: question.answers.length,
          itemBuilder: (context, index) {
            String anAnswer = question.answers[index];
            return GestureDetector(
              onTap: () => onChanged!(anAnswer),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  anAnswer,
                  style: const TextStyle(
                    fontFamily: 'linden',
                    fontWeight: FontWeight.bold,
                    fontSize: 19.5,
                    color: Color(0xff111111),
                  ),
                ),
                leading: Radio<String>(
                  value: anAnswer,
                  groupValue: selectedoption,
                  onChanged: onChanged,
                ),
              ),
            );
          }),
    );
  }
}
