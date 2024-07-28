import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimerWidget extends StatefulWidget {
  Duration duration; // Initially no duration set
  Timer? timer; // Timer object

  TimerWidget({
    required this.duration,
    required this.timer,
    super.key,
  });
  @override
  createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  @override
  void dispose() {
    widget.timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      widget.duration = const Duration(
          seconds: 30); // Set initial timer duration (30 seconds)
      widget.timer = Timer(widget.duration, _onTimerTick); // Create and start the timer
    });
  }

  void _onTimerTick() {
    setState(() {
      if (widget.duration.inSeconds > 0) {
        widget.duration -=
            const Duration(seconds: 1); // Decrement duration by 1 second
      } else {
        widget.timer?.cancel(); // Cancel the timer if it reaches 0
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String formattedDuration =
        '${twoDigits(widget.duration.inMinutes)}:${twoDigits(widget.duration.inSeconds % 60)}'; // Format the time string

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column
          children: [
            Text(
              formattedDuration,
              style: const TextStyle(fontSize: 50.0), // Adjust font size as desired
            ),
            ElevatedButton(
              onPressed: widget.duration.inSeconds == 0
                  ? _startTimer
                  : null, // Disable button if timer is running
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(color: Colors.white), // Set button text color
              ),
              child: Text(widget.duration.inSeconds == 0 ? 'Start' : 'Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
