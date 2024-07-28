import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizproject/pages/intro_page.dart';
import 'package:quizproject/provider/question_provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuestionProvider>(
            create: (_) => QuestionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
