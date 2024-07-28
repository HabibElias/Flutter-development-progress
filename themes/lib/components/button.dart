import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final Function()? onTap;
  const MyButton({
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(color: color),
            padding: const EdgeInsets.all(25),
            child: const Center(
              child: Text('TAP'),
            )));
  }
}
