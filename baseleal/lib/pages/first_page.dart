import 'dart:async';

import 'package:baseleal/pages/mezmures_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MezmuresPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BASELEAL',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'CHOIR',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
