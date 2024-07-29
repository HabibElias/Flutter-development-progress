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
    final themeselected = Theme.of(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              themeselected.colorScheme.primary,
              themeselected.colorScheme.secondary,
            ],
            stops: const [0.1, 0.75],
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
                backgroundColor: themeselected.colorScheme.onTertiary,
                progressColor: themeselected.colorScheme.tertiary,
                center: Text(
                  '${(percentage * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 19.5,
                    fontFamily: 'lily',
                    color: themeselected.colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                feedBack(percentage),
                style: TextStyle(
                  fontFamily: 'lobster',
                  fontSize: 30,
                  color: themeselected.colorScheme.onPrimary,
                ),
              ),
              // the message
              Text(
                'Try again if you want',
                style: TextStyle(
                  fontFamily: 'Linden',
                  fontSize: 19.5,
                  color: themeselected.colorScheme.onPrimary,
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
                    color: themeselected.colorScheme.tertiary,
                  ),
                  child: Center(
                    child: Text(
                      'Again?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeselected.colorScheme.onSecondary,
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
