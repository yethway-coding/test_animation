import 'package:flutter/material.dart';

class ScaleTransitionScreen extends StatefulWidget {
  const ScaleTransitionScreen({super.key});

  @override
  State<ScaleTransitionScreen> createState() => _ScaleTransitionScreenState();
}

class _ScaleTransitionScreenState extends State<ScaleTransitionScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late AnimationController controller;
  late Animation colorAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        value: 1.0,
        upperBound: 1.5,
        lowerBound: 1.0);
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => isFav = true);
      }else if (status == AnimationStatus.dismissed) {
        setState(() => isFav = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scaleController,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return IconButton(
                onPressed: () {
                  scaleController.forward().then((_) => scaleController.reverse());
                  isFav ? controller.reverse() : controller.forward();
                },
                icon: Icon(
                  Icons.favorite,
                  color: colorAnimation.value,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
