import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final Text child;
  final double strokeWidth;
  final Color? strokeColor;
  final TextOverflow? overflow;

  const OutlinedText(
      this.child, {
        super.key,
        this.strokeWidth = 2,
        this.strokeColor,
        this.overflow,
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // stroke text
        Text(
          child.data!,
          style: TextStyle(
            fontSize: child.style?.fontSize,
            fontWeight: child.style?.fontWeight,
            foreground: Paint()
              ..color = strokeColor ?? Theme.of(context).shadowColor
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth,
          ),
          // handle overflow
          overflow: overflow,
        ),
        // original text
        child
      ],
    );
  }
}