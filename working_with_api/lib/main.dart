import 'package:flutter/material.dart';
import 'package:working_with_api/Api_folder/fetch.dart';
import 'package:working_with_api/Api_folder/models.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Questions?> futureQuestions;

  @override
  void initState() {
    super.initState();
    futureQuestions = fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Questions?>(
            future: futureQuestions,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    snapshot.data!.results.first.aQuestion.replaceAll('&quot;', "'"));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
