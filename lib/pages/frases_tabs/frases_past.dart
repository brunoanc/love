import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                          shadowColor: const Color(0xff3f008d),
                          dividerColor: Colors.deepPurple.shade300,
                          weekdayStyle: TextStyle(fontWeight: FontWeight.w900, color: Colors.deepPurple.shade500),
                          headerForegroundColor: Colors.deepPurple.shade500
                        )),

                        child: DatePickerDialog(
                          cancelText: 'Cancelar',
                          confirmText: 'OK',
                          helpText: 'Selecciona una fecha',
                          initialDate: DateTime.now().subtract(const Duration(days: 1)),
                          firstDate:	DateTime(2023, 1, 20),
                          lastDate: DateTime.now().subtract(const Duration(days: 1)),
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
                  );
                });
              },
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      width: 25,
                      height: 25,
                      'assets/icons/calendar.png'
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Seleccionar fecha",
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
