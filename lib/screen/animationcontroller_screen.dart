import 'package:flutter/material.dart';
import 'package:test_animation/screen/scaletransition_screen.dart';

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation<double> curve;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    colorAnimation =
        ColorTween(begin: Colors.grey.shade400, end: Colors.red).animate(curve);
    sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 70), weight: 70),
      TweenSequenceItem(tween: Tween<double>(begin: 70, end: 50), weight: 70),
    ]).animate(curve);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => isFav = true);
      } else if (status == AnimationStatus.dismissed) {
        setState(() => isFav = false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Center(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            isFav ? controller.reverse() : controller.forward();
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: colorAnimation.value,
                            size: sizeAnimation.value,
                          )),
                    ),
                  ),
                );
              }),
          Positioned(
              bottom: 8,
              right: 8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ScaleTransitionScreen()));
                },
                child: const Text('Another Way'),
              ))
        ],
      ),
    );
  }
}
