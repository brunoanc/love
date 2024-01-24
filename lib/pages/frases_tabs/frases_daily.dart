import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globals.dart' as globals;
import 'package:flutter/cupertino.dart';

class FrasesDaily extends StatefulWidget {
  const FrasesDaily({super.key});

  @override
  State<FrasesDaily> createState() => _FrasesDailyState();
}

class _FrasesDailyState extends State<FrasesDaily> {
  int revealButtonStatus = 1;
  String loadingButtonText = 'Cargando amor...';
  ValueKey loadingButtonKey = const ValueKey(2);
  final date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final frase = OverflowBox(
      minWidth: 0,
      minHeight: 0,
      maxWidth: null,
      maxHeight: double.infinity,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          globals.frasesMap[date] ?? '',
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Tu mensajito de hoy es:',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 5),

            SizedBox(
              height: 90,
              child: FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.getString('last-uncovered') == date) { /// CHANGE
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: switch(revealButtonStatus) {
                          1 => CupertinoButton(
                            padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                            borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
                            color: theme.colorScheme.surface,
                            key: const ValueKey(1),
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Lottie.asset(
                                    width: 40,
                                    height: 40,
                                    'assets/animations/wired-outline-1865-shooting-stars.json'
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Revelar',
                                    style: theme.textTheme.displaySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                revealButtonStatus = 2;
                              });

                              Future.delayed(const Duration(seconds: 5), () {
                                setState(() {
                                  loadingButtonText = 'Buscando palabras lindas...';
                                  loadingButtonKey = const ValueKey(3);
                                });

                                Future.delayed(const Duration(seconds: 5), () {
                                  setState(() {
                                    loadingButtonText = 'Escribiendo mensajito...';
                                    loadingButtonKey = const ValueKey(4);
                                  });

                                  Future.delayed(const Duration(seconds: 5), () async {
                                    setState(() {
                                      revealButtonStatus = 3;
                                    });

                                    await snapshot.data!.setString('last-uncovered', date);
                                  });
                                });
                              });
                            },
                          ),

                          2 => ElevatedButton(
                            key: loadingButtonKey,
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              disabledBackgroundColor: theme.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Lottie.asset(
                                      width: 40,
                                      height: 40,
                                      'assets/animations/loading.json'
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      loadingButtonText,
                                      style: theme.textTheme.headlineSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          3 => frase,

                          _ => Container(),
                        }
                      );
                    }
                    else {
                      return frase;
                    }
                  }
                  else {
                    return Container();
                  }
                }
              ),
            ),

            Expanded(child: Container()),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
