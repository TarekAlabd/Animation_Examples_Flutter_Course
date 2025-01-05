import 'package:flutter/material.dart';

class BlackHoleSpin extends StatefulWidget {
  const BlackHoleSpin({super.key});

  @override
  State<BlackHoleSpin> createState() => _BlackHoleSpinState();
}

class _BlackHoleSpinState extends State<BlackHoleSpin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    if (_animationController.isAnimating) {
                      _animationController.stop();
                    } else {
                      _animationController.repeat();
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns: _animationController,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/black_hole.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
