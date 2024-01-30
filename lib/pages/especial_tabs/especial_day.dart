import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../globals.dart' as globals;

import 'package:timer_count_down/timer_count_down.dart';

class EspecialDay extends StatefulWidget {
  const EspecialDay({super.key});

  @override
  State<EspecialDay> createState() => _EspecialDayState();
}

class _EspecialDayState extends State<EspecialDay> {
  late ConfettiController _confettiController;
  final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool confetti = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  static String formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0){
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(':');
  }

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);

    if (confetti) {
      _confettiController.play();
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: - pi / 2, // radial value - LEFT
            blastDirectionality: BlastDirectionality.explosive,
            //particleDrag: 0.05, // apply drag to the confetti
            emissionFrequency: 0.2, // how often it should emit
            numberOfParticles: 20, // number of particles to emit
            gravity: 0.1, // gravity - or fall speed
            shouldLoop: false,
            colors: const [
              Color.fromARGB(255, 154, 113, 231)
            ], // manually specify the colors to be used
          ),
        ),

        /*Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              _confettiController.play();
            },
            child: const Text('TEST', style: TextStyle(color: Colors.white)),
          ),
        ),*/

        Align(
          alignment: Alignment.center,
          child: globals.especialMap.containsKey(date)
          ? Text(globals.especialMap[date]!)
          : (
            globals.especialMap.firstKeyAfter(date) == null
            ? const Text('Ya no hay mas mensajitos especiales, pero siempre recuerda que te quiero bebé <3')
            : Countdown(
              seconds: DateTime.parse(globals.especialMap.firstKeyAfter(date)!).difference(DateTime.now()).inSeconds,
              build: (BuildContext context, double time) => Text(formatDuration(Duration(seconds: time.floor()))),
              interval: const Duration(seconds: 1),
              onFinished: () {
                setState(() {
                  confetti = true;
                });
              },
            )
          ),
        ),
      ],
    );
  }
}
