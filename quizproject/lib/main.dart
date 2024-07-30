import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizproject/pages/intro_page.dart';
import 'package:quizproject/provider/question_provider.dart';
import 'package:quizproject/provider/theme_provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuestionProvider>(
          create: (context) => QuestionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Themeprovider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<Themeprovider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
