import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizproject/models/question_model.dart';
import 'package:quizproject/models/question_view.dart';
import 'package:quizproject/pages/outro_page.dart';
import 'package:quizproject/provider/question_provider.dart';
import 'package:quizproject/provider/theme_provider.dart';

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
          Timer(const Duration(seconds: 1), () {
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
    final themeofContext = Provider.of<Themeprovider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(
          'Quiz Time',
          style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).colorScheme.onSecondary,
            fontFamily: 'Lobster',
          ),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: Scaffold.of(context).openDrawer,
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Darkmode',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Libre',
                ),
              ),
              CupertinoSwitch(
                value: themeofContext.isDarkmode,
                onChanged: (value) {
                  themeofContext.chageThemeData();
                },
              ),
            ],
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
                    Icons.alarm,
                    size: 50,
                    color: Color(0xffFFE0B2),
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
                    timeleft == 0 ? 'Done' : '$timeleft Sec',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 21,
                      fontFamily: 'Libre',
                    ),
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
                  IconButton(
                    hoverColor: const Color.fromARGB(95, 69, 69, 69),
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xff757171),
                      ),
                    ),
                    onPressed: () => setState(() {
                      carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }),
                    color: const Color(0xffE1E1E1),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    hoverColor: const Color.fromARGB(95, 69, 69, 69),
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xff757171),
                      ),
                    ),
                    onPressed: () => setState(() {
                      carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }),
                    color: const Color(0xffE1E1E1),
                    icon: const Icon(Icons.arrow_forward_ios),
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
