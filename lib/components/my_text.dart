import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final List<Shadow>? shadow;
  final Color? backgroundColor;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final double? wordSpacing;
  final double? letterSpacing;
  final int? maxLines;
  const MyText(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.overflow,
    this.wordSpacing,
    this.letterSpacing,
    this.maxLines,
    this.backgroundColor,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size ?? 15,
        color: color,
        shadows: shadow,
        backgroundColor: backgroundColor,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        overflow: overflow,
        fontWeight: weight ?? FontWeight.w400,
      ),
    );
  }
}
