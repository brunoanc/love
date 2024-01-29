import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class EspecialDay extends StatefulWidget {
  const EspecialDay({super.key});

  @override
  State<EspecialDay> createState() => _EspecialDayState();
}

class _EspecialDayState extends State<EspecialDay> {
  late ConfettiController _confettiController;

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

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);

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

        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              _confettiController.play();
            },
            child: const Text('TEST', style: TextStyle(color: Colors.white)),
          ),
        ),

        
      ],
    );
  }
}
