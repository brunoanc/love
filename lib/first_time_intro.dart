import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'home_page.dart';
import 'onboarding_screen.dart';

class FirstTimeIntro extends StatefulWidget {
  const FirstTimeIntro({super.key});

  @override
  State<FirstTimeIntro> createState() => _FirstTimeIntroState();
}

class _FirstTimeIntroState extends State<FirstTimeIntro> with AfterLayoutMixin<FirstTimeIntro> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (!seen) { /// CHANGE
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      await prefs.setBool('seen', true);
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
