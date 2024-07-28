import 'package:flutter/material.dart';
import 'package:quizproject/pages/quiz_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
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
              const SizedBox(
                height: 200,
              ),
              // the Logo
              Text(
                'Quiz Time',
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'Lobster',
                ),
              ),

              const SizedBox(height: 15),

              // the message
              Text(
                'Are you ready for a quiz?',
                style: TextStyle(
                  fontFamily: 'Linden',
                  fontSize: 19.5,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              const SizedBox(height: 183),

              // the start button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Center(
                    child: Text(
                      'Start quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
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
