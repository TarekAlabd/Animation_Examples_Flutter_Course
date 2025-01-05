import 'package:flutter/material.dart';

class UniverseGalaxy extends StatefulWidget {
  const UniverseGalaxy({super.key});

  @override
  State<UniverseGalaxy> createState() => _UniverseGalaxyState();
}

class _UniverseGalaxyState extends State<UniverseGalaxy> {
  double _sliderValue = 0.0;
  Color? _newColor = Colors.white;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<Color?>(
                  duration: const Duration(seconds: 1),
                  tween: ColorTween(begin: Colors.white, end: _newColor),
                  child: Image.asset(
                    'assets/images/sun.png',
                    fit: BoxFit.cover,
                  ),
                  builder: (_, Color? color, myChild) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        color ?? Colors.transparent,
                        BlendMode.modulate,
                      ),
                      child: myChild,
                    );
                  }),
              Card(
                child: Slider.adaptive(
                  value: _sliderValue,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                      _newColor =
                          Color.lerp(Colors.white, Colors.red, _sliderValue);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
