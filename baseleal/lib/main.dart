import 'package:baseleal/pages/splash_page.dart';
import 'package:baseleal/providers/mezmure_provider.dart';
// import 'package:baseleal/providers/mezmure_provider.dart';
import 'package:baseleal/themes/lightmode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDDy5YxVeQxS0Or2wnr5EoNxpbXdqmTWcs",
        authDomain: "baseleal-9fb49.firebaseapp.com",
        projectId: "baseleal-9fb49",
        storageBucket: "baseleal-9fb49.appspot.com",
        messagingSenderId: "278126871771",
        appId: "1:278126871771:web:ec0586009d89ccbd6678fe",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  //init the hive
  await Hive.initFlutter();

  // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
  var box = await Hive.openBox('myBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MezmureProvider>(
          create: (context) => MezmureProvider(),
        ),
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
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightmode,
    );
  }
}
