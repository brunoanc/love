import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_pages/intro_page_1.dart';
import 'intro_pages/intro_page_2.dart';
import 'intro_pages/intro_page_3.dart';
import '../home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key, required this.firstTime});

  final bool firstTime;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  bool onFirstPage = true;
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onFirstPage = (index == 0);
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          Container(
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Icon(Icons.arrow_back, color: onFirstPage ? Colors.transparent : Colors.white),
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Colors.deepPurple.shade700,
                    dotColor: Colors.deepPurple.shade100,
                    dotHeight: 20,
                    dotWidth: 20,
                    spacing: 16,
                  ),
                ),

                onLastPage
                ? GestureDetector(
                  onTap: () {
                    if (widget.firstTime) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    }
                    else {
                      Navigator.pop(context);
                    }
                  },
                  child: const Icon(Icons.check, color: Colors.white),
                )
                : GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
