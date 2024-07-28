import 'package:flutter/material.dart';
import 'package:themes/models/theme_provider.dart';
import 'package:themes/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
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
      home: const HomePage(),
    );
  }
}
