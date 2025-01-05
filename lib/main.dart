import 'package:animation_examples/implicit_animation/fade_in_anim.dart';
import 'package:animation_examples/implicit_animation/shape_shifting.dart';
import 'package:animation_examples/implicit_animation/universe_galaxy.dart';
import 'package:animation_examples/lottie_page.dart';
import 'package:animation_examples/implicit_animation/star_implicit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UniverseGalaxy(),
    );
  }
}
