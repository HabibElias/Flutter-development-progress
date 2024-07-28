import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizproject/models/questionviewer.dart';
import 'package:quizproject/models/question_model.dart';
import 'package:quizproject/provider/question_provider.dart';

// ignore: must_be_immutable
class QuestionView extends StatefulWidget {
  final CarouselController carouselController;
  const QuestionView({
    required this.carouselController,
    super.key,
  });

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(builder: (context, value, child) {
      List<Question> questions = value.getQuestions;
      return Expanded(
        child: FlutterCarousel.builder(
          options: CarouselOptions(
            controller: widget.carouselController,
            enableInfiniteScroll: false,
            height: MediaQuery.of(context).size.height * 0.6,
            enlargeCenterPage: true,
            showIndicator: false,
          ),
          itemCount: questions.length,
          itemBuilder:
              (BuildContext context, int questionIndex, int pageViewIndex) {
            // var selectedoption = value.getAnswers(questionIndex).first;
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  border: const Border.fromBorderSide(
                      BorderSide(color: Colors.white)),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(28, 17, 17, 17),
                      blurRadius: 30,
                      offset: Offset(0, 30),
                    )
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //question
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            questions[questionIndex].aquestion,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Linden',
                                fontSize: 19.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff111111)),
                          ),
                        ),
                      ),
                    ),
                    //the answers with radio buttons,
                    QuetionViewer(
                      selectedoption: questions[questionIndex].selectedoption,
                      question: questions[questionIndex],
                      onChanged: (String? newvalue) {
                        setState(() {
                          questions[questionIndex].selectedoption = newvalue!;
                          value.changeAnswer(questionIndex);
                        });
                      },
                    ),
                  ]),
            );
          },
        ),
      );
    });
  }
}
