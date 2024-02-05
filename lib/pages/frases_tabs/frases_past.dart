import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../globals.dart' as globals;

class FrasesPast extends StatelessWidget {
  const FrasesPast({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ve mensajitos pasados:',
              style: theme.textTheme.headlineMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            CupertinoButton(
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
              borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
              color: theme.colorScheme.surface,
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 20), () {
                  showGeneralDialog<DateTime>(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return Theme(
                        data: ThemeData.from(
                          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
                            surface: const Color(0xffd3bbff),
                            onSurface: Colors.white,
                            onSurfaceVariant: Colors.white,
                          ),
                        ).copyWith(datePickerTheme: DatePickerThemeData(
                          shadowColor: theme.colorScheme.onBackground,
                          dividerColor: Colors.deepPurple.shade300,
                          weekdayStyle: TextStyle(fontWeight: FontWeight.w900, color: Colors.deepPurple.shade500),
                          headerForegroundColor: Colors.deepPurple.shade500
                        )),

                        child: DatePickerDialog(
                          confirmText: 'OK',
                          initialDate: DateTime.now().isBefore(DateTime.parse(globals.frasesMap.lastKey()!)) ? DateTime.now() : DateTime.parse(globals.frasesMap.lastKey()!),
                          firstDate:	DateTime.parse(globals.frasesMap.firstKey()!),
                          lastDate: DateTime.now().isBefore(DateTime.parse(globals.frasesMap.lastKey()!)) ? DateTime.now() : DateTime.parse(globals.frasesMap.lastKey()!),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        ),
                      );
                    },
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
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      showGeneralDialog<String>(
                        context: context,
                        pageBuilder: (context, anim1, anim2) => Dialog.fullscreen(
                          child: Scaffold(
                            floatingActionButton:  CupertinoButton(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                              borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
                              color: theme.colorScheme.surface,
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
                                      AutoSizeText(
                                        'Tu mensajito del ${DateFormat("d 'de' MMMM").format(selectedDate)} fue:',
                                        style: theme.textTheme.headlineMedium!.copyWith(
                                          color: theme.colorScheme.onPrimary,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),

                                      const SizedBox(height: 5),

                                      AutoSizeText(
                                        globals.frasesMap[DateFormat('yyyy-MM-dd').format(selectedDate)] ?? '',
                                        style: theme.textTheme.titleLarge!.copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.center,
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
                    }
                  });
                });
              },
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Seleccionar fecha',
                      style: theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
