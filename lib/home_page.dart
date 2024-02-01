import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:lottie/lottie.dart';
import 'pages/frases.dart';
import 'pages/especial.dart';
import 'pages/audios.dart';
import 'pages/mensajes.dart';
import 'pages/configuracion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
  final List<Widget> pages = const <Widget>[
    Frases(),
    Especial(),
    Audios(),
    Mensajes(),
    Configuracion(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        showLabel: false,
        color: theme.colorScheme.surface,
        itemLabelStyle: const TextStyle(color: Color.fromARGB(255, 217, 217, 217)),
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
                'assets/animations/wired-outline-20-love-heart.json'
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
                'assets/icons/wired-outline-20-love-heart.png'
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
                'assets/animations/wired-outline-1103-confetti.json'
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
                'assets/icons/wired-outline-1103-confetti.png'
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
                'assets/animations/wired-outline-188-microphone-recording.json'
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
                'assets/icons/wired-outline-188-microphone-recording.png'
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
                'assets/animations/wired-outline-177-envelope-send.json'
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
                'assets/icons/wired-outline-177-envelope-send.png'
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
                'assets/animations/wired-outline-1330-rest-api.json'
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
                'assets/icons/wired-outline-1330-rest-api.png'
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
      body: FadeIndexedStack(
        index: currentPageIndex,
        children: pages,
      )
    );
  }
}

class FadeIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const FadeIndexedStack({
    Key? key,
    this.index = 0,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  State<FadeIndexedStack> createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _secondaryController;
  late Animation<double> animation;
  late Animation<double> secondaryAnimation;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
      _secondaryController.forward(from: 1.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _secondaryController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
    secondaryAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _secondaryController,
      curve: Curves.ease,
    ));
    _controller.forward();
    _secondaryController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _secondaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: LazyLoadIndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
