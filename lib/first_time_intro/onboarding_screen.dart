import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_page.dart';
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
                onLastPage = (index == 6);
              });
            },
            children: const [
              IntroPage(
                title: '¡Bienvenida a tu app!',
                description: 'Ya lo imaginabas, ¿no? Acompáñame a descubrir la mejor app del mundo, solo para mi princesa <3',
                image: 'levels-app-development-with-ux-slash-ui-design.png'
              ),
              IntroPage(
                title: '¡Levántate más bonito!',
                description: 'Recibe un mensajito lindo para levantarte con mucho amor todos los días <3',
                image: '3d-casual-life-like.png'
              ),
              IntroPage(
                title: 'Cartitas... ¡sorpresa!',
                description: '¡Prepárate para recibir una cartita sorpresa en nuestras fechas especiales!',
                image: '3d-casual-life-thank-you-letter-in-envelope.png'
              ),
              IntroPage(
                title: '¿Extrañas mi voz?',
                description: 'Escucha uno de los audios que grabé solo para tí :)',
                image: '3d-casual-life-airpods-max-pink.png'
              ),
              IntroPage(
                title: '¿Quieres un abracito?',
                description: 'Envíame un mensajito directo a mi teléfono, una vez al día :D',
                image: 'casual-life-3d-young-man-texting-his-significant-other.png'
              ),
              IntroPage(
                title: '¿Quieres cortarme?',
                description: 'Revisa la configuración de la app, a ver que pasa...',
                image: '3d-casual-life-screwdriver-and-wrench-as-settings.png'
              ),
              IntroPage(
                title: 'Te adoro <3',
                description: 'Espero que te guste muchísimo este regalito mi vida, te amo 🥺',
                image: '3d-casual-life-chatgpt-robot-with-heart.png'
              ),
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
                  count: 7,
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
