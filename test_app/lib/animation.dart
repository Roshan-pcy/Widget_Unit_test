import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  late final _colorAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _borderRadius;

  @override
  void initState() {
    super.initState();
    _animationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _widthAnimation = Tween<double>(begin: 0, end: 190).animate(
        CurvedAnimation(parent: _animationcontroller, curve: Curves.easeInOut));
    _colorAnimation = ColorTween(
            begin: Color.fromARGB(255, 228, 68, 228),
            end: const Color.fromARGB(255, 47, 206, 52))
        .animate(CurvedAnimation(
            parent: _animationcontroller, curve: Curves.easeInOut));
    _borderRadius = Tween<double>(begin: 0.0, end: 30).animate(
        CurvedAnimation(parent: _animationcontroller, curve: Curves.easeInOut));
    _animationcontroller.forward();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animationcontroller,
      builder: (context, child) {
        return Center(
          child: Container(
              width: _widthAnimation.value,
              height: _widthAnimation.value,
              decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: BorderRadius.circular(_borderRadius.value))),
        );
      },
    ));
  }
}
