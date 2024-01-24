import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 169, 54, 204),
      child: const Center(
        child: Text('Page 1'),
      ),
    );
  }
}
