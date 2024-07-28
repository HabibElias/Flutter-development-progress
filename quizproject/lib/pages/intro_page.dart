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
              const SizedBox(
                height: 200,
              ),
              // the Logo
              const Text(
                'Quiz Time',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Lobster',
                ),
              ),

              const SizedBox(height: 15),

              // the message
              const Text(
                'Are you ready for a quiz?',
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
                    color: const Color(0xffADD8E6),
                  ),
                  child: const Center(
                    child: Text(
                      'Start quiz',
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
