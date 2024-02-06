import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../first_time_intro/onboarding_screen.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SettingsList(
            darkTheme: SettingsThemeData(
              settingsListBackground: theme.colorScheme.background,
              titleTextColor: theme.colorScheme.onBackground,
              leadingIconsColor: Colors.deepPurple.shade400,
              tileDescriptionTextColor: Colors.deepPurple.shade400,
              settingsTileTextColor: theme.colorScheme.onBackground,
            ),
            sections: [
              SettingsSection(
                title: const Text('Relación'),
                tiles: <SettingsTile>[
                  SettingsTile.switchTile(
                    initialValue: true,
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text('Estado de la relación'),
                    description: const Text('Juntitas'),
                    activeSwitchColor: theme.colorScheme.onBackground,
                    onToggle: (value) {
                      showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('¿Me vas a cortar?', style: TextStyle(color: theme.colorScheme.onBackground)),
                          content: Image.asset(
                            fit: BoxFit.cover,
                            'assets/images/drama.png'
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('No', style: TextStyle(color: theme.colorScheme.onBackground)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text('Sí', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                          contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                          actionsPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        ),
                      ).then((value) {
                        if (value == true) {
                          showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('¿Segura de que quieres cortarme?', style: TextStyle(color: theme.colorScheme.onBackground)),
                              content: Image.asset(
                                fit: BoxFit.cover,
                                'assets/images/hamster.png'
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: Text('No', style: TextStyle(color: theme.colorScheme.onBackground)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text('Sí', style: TextStyle(color: Colors.red)),
                                ),
                              ],
                              contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                              actionsPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            ),
                          ).then((value) {
                            if (value == true) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('No autorizo.', style: TextStyle(color: theme.colorScheme.onBackground)),
                                  content: Image.asset(
                                    fit: BoxFit.cover,
                                    'assets/images/ew.png'
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Soporta <3', style: TextStyle(color: theme.colorScheme.onBackground)),
                                    ),
                                  ],
                                  contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                                  actionsPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                ),
                              );
                            }
                          });
                        }
                      });
                    },
                  ),

                  SettingsTile.navigation(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Sobre nosotras'),
                    description: const Text('Hoy y siempre'),
                    onPressed: (context) {
                      showGeneralDialog<String>(
                        context: context,
                        pageBuilder: (context, anim1, anim2) => Dialog.fullscreen(
                          child: Scaffold(
                            backgroundColor: Colors.yellow.shade100,
                            floatingActionButton:  CupertinoButton(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                              borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
                              color: Colors.yellow,
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Regresar',
                                style: theme.textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                            body: SafeArea(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Image.asset(
                                          'assets/images/nosotras.jpg',
                                          fit: BoxFit.fill,
                                          //width: imageDimension,
                                          //height: imageDimension,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Text(
                                        'hoy y siempre',
                                        style: theme.textTheme.headlineMedium!.copyWith(
                                          color: Colors.black,
                                          fontFamily: 'Fearless'
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        transitionBuilder: (context, anim1, anim2, child) {
                          return FadeTransition(
                            opacity: anim1.drive(
                              Tween(
                                begin: 0,
                                end: 1,
                              ),
                            ),
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 300),
                        barrierDismissible: true,
                        barrierLabel: '',
                      );
                    },
                  ),
                ],
              ),

              SettingsSection(
                title: const Text('App'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('Acerca de'),
                    description: const Text('Conoce más de la app'),
                    onPressed: (context) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OnBoardingScreen(firstTime: false)));
                    },
                  ),

                  SettingsTile.navigation(
                    leading: const Icon(Icons.lock_reset_outlined),
                    title: const Text('Reestablecer app', style: TextStyle(color: Colors.red)),
                    description: const Text('Reeestablece valores predeterminados'),
                    onPressed: (context) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          String password = '';
                          return StatefulBuilder(
                            builder: (context, setState) => AlertDialog(
                              title: Text('Introduce la contraseña', style: TextStyle(color: theme.colorScheme.onBackground)),
                              content: TextField(
                                obscureText: true,
                                cursorColor: theme.colorScheme.onBackground.withAlpha(0x7f),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.onBackground.withAlpha(0x7f))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.onBackground, width: 1.5)),
                                  labelText: 'Contraseña',
                                  labelStyle: TextStyle(color: theme.colorScheme.onBackground.withAlpha(0x7f)),
                                  floatingLabelStyle: TextStyle(color: theme.colorScheme.onBackground),
                                  alignLabelWithHint: true,
                                ),
                                keyboardType: TextInputType.multiline,
                                onChanged: (value) => setState(() {
                                  password = value;
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
                                  onPressed: (password != 'uL6u\$32f8*rq4L') ? null : () {
                                    Navigator.pop(context, password);
                                  },
                                  child: Text('Reestablecer', style: TextStyle(color: (password != 'uL6u\$32f8*rq4L') ? Colors.red.withAlpha(0x4c) : Colors.red)),
                                ),
                              ],
                              contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                              actionsPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            ),
                          );
                        },
                      ).then((value) async {
                        if (value != 'uL6u\$32f8*rq4L') {
                          return;
                        }

                        SharedPreferences.getInstance().then((prefs) => prefs.clear()).then((_) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Valores reestablecidos', style: TextStyle(color: theme.colorScheme.onBackground)),
                              content: const Text(
                                'Los valores de la aplicación fueros reestablecidos exitosamente.',
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
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
