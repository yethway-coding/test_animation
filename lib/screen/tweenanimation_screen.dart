import 'package:flutter/material.dart';
import 'package:test_animation/screen/animationcontroller_screen.dart';

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(top: value * 40),
                      child: child,
                    ));
              },
              child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                      child: Text('Hello world',
                          style: TextStyle(color: Colors.white)))),
            ),
          ),
          Positioned(bottom: 8, right: 8, child: ElevatedButton(onPressed: () { 
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AnimationControllerScreen()));
          },
          child: const Text('Go to AnimationController'),))
        ],
      ),
    );
  }
}
