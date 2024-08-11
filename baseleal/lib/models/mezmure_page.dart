import 'package:baseleal/models/mezmure.dart';
import 'package:flutter/material.dart';

class MezmurePage extends StatefulWidget {
  final Mezmure mezmure;

  const MezmurePage({
    required this.mezmure,
    super.key,
  });

  @override
  State<MezmurePage> createState() => _MezmurePageState();
}

class _MezmurePageState extends State<MezmurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.mezmure.name,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              thickness: 2,
              color: Color(0xff82837c),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: 320,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.mezmure.mezmure.replaceAll('\\n', '\n'),
                        style: Theme.of(context).textTheme.bodySmall,
                        // textAlign: TextAlign.center,
                      ),
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
