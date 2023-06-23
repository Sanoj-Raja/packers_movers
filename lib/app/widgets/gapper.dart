import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  final double gap;
  const VerticalGap({super.key, this.gap = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap,
    );
  }
}

class HorizontalGap extends StatelessWidget {
  final double gap;
  const HorizontalGap({super.key, this.gap = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: gap,
    );
  }
}
