import 'package:flutter/material.dart';
import 'package:test_animation/screen/tweenanimation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _margin = 0.0;
  var _opacity = 1.0;
  var _color = Colors.red;
  var _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 5),
        width: _width,
        margin: EdgeInsets.all(_margin),
        color: _color,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => setState(() => _width = 500.0),
                      child: const Text('Width Animation')),
                  ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.blue),
                      child: const Text('Color Animation')),
                  ElevatedButton(
                      onPressed: () => setState(() => _margin = 20.0),
                      child: const Text('Margin Animation')),
                  ElevatedButton(
                      onPressed: () => setState(() => _opacity = 0.0),
                      child: const Text('Opacity Animation')),
                  AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(seconds: 5),
                      child: const Text('Hide me',
                          style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
            Positioned(
                bottom: 8,
                right: 8,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TweenAnimationScreen())),
                    child: const Text('Go to TweenAnimation')))
          ],
        ),
      ),
    );
  }
}
