import 'package:flutter/material.dart';

class BeamSpaceship extends StatefulWidget {

  const BeamSpaceship({super.key});

  @override
  State<BeamSpaceship> createState() => _BeamSpaceshipState();
}

class _BeamSpaceshipState extends State<BeamSpaceship> with SingleTickerProviderStateMixin {
  final Image starsBackground = Image.asset(
    'assets/images/milky-way.png',
    fit: BoxFit.cover,
    height: double.infinity,
  );

  final Image ufo = Image.asset('assets/images/ufo.png');
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
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
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        starsBackground,
        Opacity(
          opacity: 0.6,
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ),
        BeamAnimation(animationController: _animationController),
        ufo,
      ],
    );
  }
}

class BeamAnimation extends AnimatedWidget {
  const BeamAnimation({
    super.key,
    required AnimationController animationController,
  }) : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    
    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: const [
              Colors.yellow,
              Colors.transparent,
            ],
            stops: [0, animation.value],
          ),
        ),
      ),
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
