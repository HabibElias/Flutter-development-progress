import 'package:baseleal/models/mezmures/%E1%88%85%E1%8B%AB%E1%8B%8D%20%E1%88%98%E1%88%B5%E1%8B%8B%E1%8B%95%E1%89%B5.dart';
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: () {},
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Divider(
              thickness: 2,
              color: Color(0xff82837c),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SingleChildScrollView(
                    child: Text(
                      mezmure,
                      style: const TextStyle(
                        fontFamily: 'Ethiopic Sadiss',
                        color: Color(0xff141414),
                        fontSize: 18.75,
                        height: 1.5,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
