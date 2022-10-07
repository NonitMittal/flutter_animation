import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child:
              Padding(padding: EdgeInsets.only(top: value * 25), child: child),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5),
      ),
    );
  }
}
