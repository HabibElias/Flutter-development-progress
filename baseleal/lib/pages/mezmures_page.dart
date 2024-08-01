import 'package:flutter/material.dart';

class MezmuresPage extends StatefulWidget {
  const MezmuresPage({super.key});

  @override
  State<MezmuresPage> createState() => _MezmuresPageState();
}

class _MezmuresPageState extends State<MezmuresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Our Mezmure',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.inversePrimary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 1],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
