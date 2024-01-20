import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'pages/frases.dart';
import 'pages/especial.dart';
import 'pages/audios.dart';
import 'pages/configuracion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        showLabel: false,
        //color: Colors.deepPurple.shade300,
        color: theme.colorScheme.surface,
        itemLabelStyle: const TextStyle(color: Color.fromARGB(255, 217, 217, 217)),
        //notchColor: const Color.fromARGB(255, 191, 160, 248),
        bottomBarItems: [
          BottomBarItem(
            activeItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Lottie.asset(
                  width: 40,
                  height: 40,
                  repeat: false,
                  'assets/wired-outline-20-love-heart.json'
                ),
              ),
            inActiveItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Image.asset(
                  width: 40,
                  height: 40,
                  'assets/wired-outline-20-love-heart.png'
                ),
              ),
          ),
          BottomBarItem(
            activeItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Lottie.asset(
                  width: 40,
                  height: 40,
                  repeat: false,
                  'assets/wired-outline-412-gift.json'
                ),
              ),
            inActiveItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Image.asset(
                  width: 40,
                  height: 40,
                  'assets/wired-outline-412-gift.png'
                ),
              ),
          ),
          BottomBarItem(
            activeItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Lottie.asset(
                  width: 40,
                  height: 40,
                  repeat: false,
                  'assets/wired-outline-188-microphone-recording.json'
                ),
              ),
            inActiveItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Image.asset(
                  width: 40,
                  height: 40,
                  'assets/wired-outline-188-microphone-recording.png'
                ),
              ),
          ),
          BottomBarItem(
            activeItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Lottie.asset(
                  width: 40,
                  height: 40,
                  repeat: false,
                  'assets/wired-outline-1330-rest-api.json'
                ),
              ),
            inActiveItem: OverflowBox(
                minWidth: 0,
                minHeight: 0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Image.asset(
                  width: 40,
                  height: 40,
                  'assets/wired-outline-1330-rest-api.png'
                ),
              ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        kIconSize: 24.0,
        kBottomRadius: 28.0,
      ),
      extendBody: true,
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: <Widget>[
          const Frases(),
          const Especial(),
          const Audios(),
          const Configuracion(),
        ][currentPageIndex],
      ),
    );
  }
}
