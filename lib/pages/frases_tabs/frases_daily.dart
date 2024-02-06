import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globals.dart' as globals;

class FrasesDaily extends StatefulWidget {
  const FrasesDaily({super.key});

  @override
  State<FrasesDaily> createState() => _FrasesDailyState();
}

class _FrasesDailyState extends State<FrasesDaily> with AutomaticKeepAliveClientMixin {
  bool revealButtonStatus = true;
  String loadingButtonText = 'Revelar';
  final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool showFrase = false;

  @override
  bool wantKeepAlive = true;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ThemeData theme = Theme.of(context);
    final frase = Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: AutoSizeText(
        globals.frasesMap[date] ?? '',
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.normal,
          fontFamily: 'Bruno',
        ),
        textAlign: TextAlign.center,
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

            FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                if (snapshot.hasData) {
                  if (DateTime.now().isAfter(DateTime.parse(globals.frasesMap.lastKey()!).copyWith(hour: 23, minute: 59, second: 59))) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        'Ya no hay mas mensajitos, pero siempre recuerda que te amo corazón <3',
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  else if (snapshot.data!.getString('last-uncovered') != date) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: showFrase
                      ? frase
                      : SizedBox(
                        key: Key(loadingButtonText),
                        height: 90,
                        child: revealButtonStatus
                        ? CupertinoButton(
                          padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                          borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
                          color: theme.colorScheme.surface,
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
                                  loadingButtonText,
                                  style: theme.textTheme.displaySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              loadingButtonText = 'Cargando amor...';
                              revealButtonStatus = false;
                            });

                            Future.delayed(const Duration(seconds: 5), () {
                              setState(() {
                                loadingButtonText = 'Buscando palabras lindas...';
                              });

                              Future.delayed(const Duration(seconds: 5), () {
                                setState(() {
                                  loadingButtonText = 'Escribiendo mensajito...';
                                });

                                Future.delayed(const Duration(seconds: 5), () async {
                                  setState(() {
                                    showFrase = true;
                                  });

                                  await snapshot.data!.setString('last-uncovered', date);
                                });
                              });
                            });
                          },
                        )
                        : ElevatedButton(
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
                      ),
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

            Expanded(child: Container()),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
