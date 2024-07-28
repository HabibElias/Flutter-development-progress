import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quizproject/pages/intro_page.dart';
import 'package:quizproject/provider/question_provider.dart';

class OutroPage extends StatelessWidget {
  final double percentage;
  const OutroPage({
    required this.percentage,
    super.key,
  });

  // print welldone message
  String feedBack(double percent) {
    if (percent == 1.0) {
      return 'Excellent';
    } else if (percent > 0.5) {
      return 'Well Done';
    } else if (percent > 0.0) {
      return 'Not Bad';
    } else {
      return 'Bad Score';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffe0b2),
              Color.fromARGB(255, 139, 69, 19),
            ],
            stops: [0.1, 0.75],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // the Logo
              CircularPercentIndicator(
                radius: 120,
                lineWidth: 25,
                percent: percentage,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: const Color.fromARGB(141, 245, 245, 245),
                progressColor: const Color(0xffADD8E6),
                center: Text(
                  '${percentage * 100}%',
                  style: const TextStyle(
                      fontSize: 19.5, fontFamily: 'lily', color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                feedBack(percentage),
                style: const TextStyle(
                  fontFamily: 'lobster',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              // the message
              const Text(
                'Try again if you want',
                style: TextStyle(
                  fontFamily: 'Linden',
                  fontSize: 19.5,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 183),

              // the start button
              GestureDetector(
                onTap: () {
                  Provider.of<QuestionProvider>(context, listen: false)
                      .initState(
                    Provider.of<QuestionProvider>(context, listen: false)
                        .getQuestions,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntroPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffADD8E6),
                  ),
                  child: const Center(
                    child: Text(
                      'Again?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff1e1e1e),
                        fontWeight: FontWeight.bold,
                        fontSize: 19.5,
                        fontFamily: 'lily',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
