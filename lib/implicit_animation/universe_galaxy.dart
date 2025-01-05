import 'package:flutter/material.dart';

class UniverseGalaxy extends StatelessWidget {
  const UniverseGalaxy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/universe.png',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: Image.asset(
              'assets/images/sun.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
