import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> with AutomaticKeepAliveClientMixin {
  var date = DateFormat('yyyy-MM-dd').format(DateTime.now());

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
      tokens.add('$days');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add(hours > 9 ? '$hours' : '0$hours');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add(minutes > 9 ? '$minutes' : '0$minutes');
    }
    tokens.add(seconds > 9 ? '$seconds' : '0$seconds');

    return tokens.join(':');
  }

  @override
  bool wantKeepAlive = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¡Mándame un mensajito!',
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.getString('last-message') != date) {
                      return CupertinoButton(
                        padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                        borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
                        color: theme.colorScheme.surface,
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 20), () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                String mensaje = '';
                                return StatefulBuilder(
                                  builder: (context, setState) => AlertDialog(
                                    content: TextField(
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      minLines: 4,
                                      maxLines: null,
                                      cursorColor: theme.colorScheme.onBackground.withAlpha(0x7f),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.onBackground.withAlpha(0x7f))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.onBackground, width: 1.5)),
                                        labelText: 'Escribe tu mensajito',
                                        labelStyle: TextStyle(color: theme.colorScheme.onBackground.withAlpha(0x7f)),
                                        floatingLabelStyle: TextStyle(color: theme.colorScheme.onBackground),
                                        alignLabelWithHint: true,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      onChanged: (value) => setState(() {
                                        mensaje = value;
                                      }),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, '');
                                        },
                                        child: Text('Cancelar', style: TextStyle(color: theme.colorScheme.onBackground)),
                                      ),
                                      TextButton(
                                        onPressed: mensaje.isEmpty ? null : () {
                                          Navigator.pop(context, mensaje);
                                        },
                                        child: Text('Enviar', style: TextStyle(color: mensaje.isEmpty ? theme.colorScheme.onBackground.withAlpha(0x4c) : theme.colorScheme.onBackground)),
                                      ),
                                    ],
                                    contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                                    actionsPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  ),
                                );
                              },
                            ).then((value) {
                              if (value?.isEmpty ?? true) {
                                return;
                              }

                              FirebaseAuth.instance.signInAnonymously()
                              .then((userCredential){
                                FirebaseDatabase database = FirebaseDatabase.instance;
                                return database.ref('users/${userCredential.user!.uid}/mensaje');
                              })
                              .then((ref) {
                                ref.set(value);

                                snapshot.data!.setString('last-message', date);
                                setState(() {
                                  date = date;
                                });

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Text('¡Mensaje enviado con éxito! <3', style: TextStyle(color: theme.colorScheme.onBackground)),
                                    content: const Text(
                                      'Tu mensaje debería llegarle a Bruno dentro de poco tiempo :)',
                                      textAlign: TextAlign.justify,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK', style: TextStyle(color: theme.colorScheme.onBackground)),
                                      ),
                                    ],
                                    contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                                    actionsPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  ),
                                );
                              });
                            });
                          });
                        },
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                              Icons.chat,
                              size: 25,
                              color: Colors.white,
                            ),
                              const SizedBox(width: 10),
                              Text(
                                'Escribir mensajito',
                                style: theme.textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    else {
                      return ElevatedButton(
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
                                Countdown(
                                  seconds: DateTime.now().add(const Duration(days: 1)).copyWith(hour: 0, minute: 0, second: 0).difference(DateTime.now()).inSeconds,
                                  build: (BuildContext context, double time) => AutoSizeText(
                                    formatDuration(Duration(seconds: time.floor())),
                                    style: theme.textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  else {
                    return Container();
                  }
                },
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
