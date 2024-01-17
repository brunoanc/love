import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    );
    print(colorScheme.onPrimary);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          background: const Color(0xffd3bbff),
          onBackground: const Color(0xff3f008d),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 191, 160, 248)
        ),
        /*colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromRGBO(126, 72, 149, 1),
          onPrimary: Color(0xffffffff),
          primaryContainer: Color(0xfff7d8ff),
          onPrimaryContainer: Color(0xff320047),
          secondary: Color(0xff69596d),
          onSecondary: Color(0xffffffff),
          secondaryContainer: Color(0xfff1dcf4),
          onSecondaryContainer: Color(0xff231728),
          tertiary: Color(0xff815250),
          onTertiary: Color(0xffffffff),
          tertiaryContainer: Color(0xffffdad8),
          onTertiaryContainer: Color(0xff331111),
          error: Color(0xffba1a1a),
          onError: Color(0xffffffff),
          errorContainer: Color(0xffffdad6),
          onErrorContainer:Color(0xff410002),
          background: Color(0xfffffbff),
          onBackground: Color(0xff1e1b1e),
          surface: Color(0xfffffbff),
          onSurface: Color(0xff1e1b1e),
          surfaceVariant: Color(0xffebdfea),
          onSurfaceVariant: Color(0xff4c444d),
          outline: Color(0xff7d747e),
          outlineVariant: Color(0xffcEc3cd),
          shadow: Color(0xff000000),
          scrim: Color(0xff000000),
          inverseSurface: Color(0xff332f33),
          onInverseSurface: Color(0xfff6eff3),
          inversePrimary: Color(0xffeab2ff),
          surfaceTint: Color(0xff7e4895),
        ),*/
        //scaffoldBackgroundColor: const Color(0xfff7d8ff),
      ),
      home: const OnBoardingScreen(),
    );
  }
}
