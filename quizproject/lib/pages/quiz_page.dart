import 'dart:async';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizproject/models/question_model.dart';
import 'package:quizproject/models/question_view.dart';
import 'package:quizproject/pages/outro_page.dart';
import 'package:quizproject/provider/question_provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // variable for the time left display
  bool isStarted = false;
  int timeleft = 30;
  Duration duration = const Duration(seconds: 1);
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chageTimer();
  }

  // method for changing the timeleft variable
  chageTimer() {
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (timeleft > 0) {
          timeleft--;
        } else {
          timer.cancel();
          Timer(const Duration(seconds: 2), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OutroPage(
                  percentage: calculation(
                    Provider.of<QuestionProvider>(context).getQuestions,
                  ),
                ),
              ),
            );
          });
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // methods for starting the time
  startTimer() {
    if (isStarted && timeleft == 0) {
      timer?.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutroPage(
            percentage: calculation(
              Provider.of<QuestionProvider>(context).getQuestions,
            ),
          ),
        ),
      );
    }
    if (isStarted == false) {
      isStarted = true;
      chageTimer();
    }
  }

  double calculation(List<Question> questions) {
    int outof = questions.length;
    double getright = 0;
    for (var question in questions) {
      if (question.answered == true) {
        getright++;
      }
    }

    return getright / outof;
  }

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffADD8E6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x80FFE0B2),
        centerTitle: true,
        title: const Text(
          'Quiz Time',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff1e1e1e),
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // the timer and the an icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // the icon
                  const Icon(
                    Icons.alarm_on_sharp,
                    size: 50,
                    color: Color(0xff1e1e1e),
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(80, 17, 17, 17),
                        blurRadius: 30,
                        offset: Offset(0, 20),
                      )
                    ],
                  )
                  // the time display
                  ,
                  Text(
                    timeleft == 0 ? 'Done' : '$timeleft seconds left',
                    style: const TextStyle(
                        color: Color(0xff1e1e1e),
                        fontSize: 21,
                        fontFamily: 'Times'),
                  )
                ],
              ),
              //
              QuestionView(
                carouselController: carouselController,
              ),
              // the button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => setState(() {
                      carouselController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    }),
                    child: const Text('angle-left', style: TextStyle(fontFamily: 'MyFlutterApp'),),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      carouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }),
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
