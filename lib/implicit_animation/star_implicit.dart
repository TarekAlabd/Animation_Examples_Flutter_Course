import 'package:flutter/material.dart';

class StarImplicit extends StatefulWidget {
  const StarImplicit({super.key});

  @override
  State<StarImplicit> createState() => _StarImplicitState();
}

class _StarImplicitState extends State<StarImplicit> {
  bool _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Implicit'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _bigger ? 500 : 100,
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
              child: Image.asset('assets/images/star.png'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bigger = !_bigger;
                });
              },
              child: const Icon(Icons.star),
            ),
          ],
        ),
      ),
    );
  }
}
