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
                  /*showDatePicker(
                    context: context,
                    firstDate: DateTime(2024, 1, 23),
                    lastDate: DateTime.now(),
                  ).then((date) {
                    if (date != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Selected: ${date.day}/${date.month}/${date.year}'),
                      ));
                    }
                  });*/
                  showGeneralDialog<DateTime>(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          datePickerTheme: DatePickerThemeData(
                            cancelButtonStyle: ElevatedButton.styleFrom(foregroundColor: Colors.white),
                            confirmButtonStyle: ElevatedButton.styleFrom(foregroundColor: Colors.white),
                            headerForegroundColor: Colors.white,
                            dividerColor: Colors.deepPurple.shade100,
                            weekdayStyle: TextStyle(color: Colors.deepPurple.shade500, fontWeight: FontWeight.w900),
                            yearBackgroundColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.deepPurple.shade500;
                              }
                              return Colors.transparent;
                            }),
                            yearForegroundColor: MaterialStateColor.resolveWith((states) {
                              if  (states.contains(MaterialState.disabled)) {
                                return Colors.white.withAlpha(101);
                              }

                              return Colors.white;
                            }),
                            dayBackgroundColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.deepPurple.shade500;
                              }
                              return Colors.transparent;
                            }),
                            dayForegroundColor: MaterialStateColor.resolveWith((states) {
                              if  (states.contains(MaterialState.disabled)) {
                                return Colors.white.withAlpha(101);
                              }

                              return Colors.white;
                            }),
                            todayForegroundColor: MaterialStateProperty.all(const Color(0xff3f008d)),
                            todayBackgroundColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.white;
                              }
                              return Colors.transparent;
                            }),
                          ),
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                            onSurface: const Color.fromARGB(255, 128, 78, 216),
                            
                          ),
                        ),
                        
                        child: DatePickerDialog(
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
