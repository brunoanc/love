import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../../globals.dart' as globals;

import 'package:timer_count_down/timer_count_down.dart';

class EspecialDay extends StatefulWidget {
  const EspecialDay({super.key});

  @override
  State<EspecialDay> createState() => _EspecialDayState();
}

class _EspecialDayState extends State<EspecialDay> with AutomaticKeepAliveClientMixin {
  late ConfettiController _confettiController;
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  bool wantKeepAlive = true;

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
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

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

    return tokens.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: -pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.2,
            numberOfParticles: 20,
            gravity: 0.1,
            shouldLoop: false,
            colors: const [
              Color.fromARGB(255, 154, 113, 231)
            ],
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: globals.especialMap.containsKey(DateFormat('yyyy-MM-dd').format(DateTime.now()))
              ? FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.getString('last-special-uncovered') == date) { // CHANGE
                      _confettiController.play();
                      snapshot.data!.setString('last-special-uncovered',  date);
                    }

                    return AutoSizeText(
                      globals.especialMap[date] ?? '',
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    );
                  }
                  else {
                    return Container();
                  }
                },
              )
              : (
                globals.especialMap.firstKeyAfter(date) == null
                ? Text(
                  'Ya no hay mas mensajitos especiales, pero siempre recuerda que te quiero bebé <3',
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                )
                : Countdown(
                  seconds: DateTime.parse(globals.especialMap.firstKeyAfter(date)!).difference(DateTime.now()).inSeconds,
                  build: (BuildContext context, double time) => AutoSizeText(
                    formatDuration(Duration(seconds: time.floor())),
                    style: theme.textTheme.displayLarge!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    setState(() {
                      date = DateFormat('yyyy-MM-dd').format(DateTime.now());
                    });
                  },
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
